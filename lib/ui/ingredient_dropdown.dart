import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:recepies/entities/recepie.dart';
import 'package:recepies/model/ingredient_store.dart';
import 'package:optional/optional.dart';

class IngredientDropdown extends HookWidget {
  const IngredientDropdown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Ingredient> current = useState(null);
    final store = GetIt.I<IngredientStore>();
    final allIngredientsSnap = useStream(store.allIngredients);
    return FormBuilderCustomField(
        attribute: "ingredient",
        validators: [FormBuilderValidators.required()],
        formField: FormField(
          builder: (field) {
            if (allIngredientsSnap.hasError) {
              Navigator.pop(context, null);
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("could not get ingredients: ${allIngredientsSnap.error}")));
              return null;
            }
            if (allIngredientsSnap.data == null)
              return DropdownButton(
                hint: Text("Loading..."),
                items: null,
                onChanged: null,
              );

            final allIngredients = allIngredientsSnap.data;
            return DropdownButton(
                isExpanded: true,
                value: allIngredients.contains(current.value) ? current.value.toOptional : null,
                hint: Text("add an ingredient"),
                items: [
                  for (var ingredient in allIngredients)
                    DropdownMenuItem(
                      child: Text(ingredient.name),
                      value: Optional.of(ingredient),
                    ),
                  DropdownMenuItem(
                    child: Text("new..."),
                    value: Optional<Ingredient>.empty(),
                  )
                ],
                onChanged: (Optional<Ingredient> val) async {
                  Ingredient ing;
                  if (val.isNotEmpty) {
                    ing = val.value;
                  } else {
                    Ingredient newIngredient =
                        await showDialog(context: context, builder: (_) => AddIngredientDialog());
                    if (newIngredient == null) {
                      return;
                    } else {
                      ing = await store.addIngredient(newIngredient);
                    }
                  }
                  current.value = ing;
                  field.didChange(ing);
                });
          },
        ));
  }
}

class AddIngredientDialog extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return AlertDialog(
      title: Text("Create new ingredient"),
      content: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(labelText: "Ingredient Name"),
          ))
        ],
      ),
      actions: <Widget>[
        FlatButton(onPressed: () => Navigator.pop(context, null), child: Text("Cancel")),
        FlatButton(
            onPressed: () => Navigator.pop(context, Ingredient(id: null, name: controller.text)), child: Text("Ok"))
      ],
    );
  }
}
