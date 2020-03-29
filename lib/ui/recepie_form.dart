import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:recepies/entities/recepie.dart';
import 'package:recepies/ui/ingredient_dropdown.dart';

class RecepieForm extends StatefulWidget {
  RecepieForm({Key key}) : super(key: key);

  @override
  _RecepieFormState createState() => _RecepieFormState();
}

class _RecepieFormState extends State<RecepieForm> {
  var _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Recepie"),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FormBuilderTextField(
                attribute: "title",
                decoration: InputDecoration(labelText: "Title"),
                validators: [FormBuilderValidators.required()],
              ),
              FormBuilderTextField(
                attribute: "body",
                decoration: InputDecoration(labelText: "Body"),
                validators: [FormBuilderValidators.required()],
              ),
              _IngredientForm()
            ],
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          child: Text("OK"),
          onPressed: () {
            if (_formKey.currentState.saveAndValidate()) {
              String title = _formKey.currentState.value["title"];
              String body = _formKey.currentState.value["body"];
              Map<Ingredient, int> ingredients = _formKey.currentState.value["ingredients"];
              assert([title, body, ingredients].every((element) => element != null));
              Navigator.pop(context, Recepie(id: null, title: title, body: body, ingredients: ingredients));
            }
          },
        ),
      ],
    );
  }
}

class _IngredientForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FormBuilderCustomField(
        attribute: "ingredients",
        formField: FormField(
          builder: (FormFieldState<Map<Ingredient, int>> field) => ListView(
            children: <Widget>[
              ...field.value.entries.map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Expanded(
                          child: Text(
                        e.key.name,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Container(
                        child: TextField(
                          controller: TextEditingController.fromValue(TextEditingValue(text: e.value.toString())),
                          onChanged: (s) {
                            field.value[e.key] = int.parse(s);
                          },
                        ),
                        width: 64,
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          field.value.remove(e.key);
                          field.didChange(field.value);
                        },
                      )
                    ]),
                  )),
              IngredientRow(
                onSubmit: (ing, amount) {
                  field.value[ing] = amount;
                  field.didChange(field.value);
                },
              )
            ],
            shrinkWrap: true,
          ),
        ),
        initialValue: const <Ingredient, int>{},
        validators: [FormBuilderValidators.required()],
      );
}

class IngredientRow extends StatefulWidget {
  const IngredientRow({
    Key key,
    @required this.onSubmit,
  }) : super(key: key);

  final void Function(Ingredient, int) onSubmit;

  @override
  _IngredientRowState createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  var _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Flexible(
            child: IngredientDropdown(),
            fit: FlexFit.loose,
          ),
          Container(
            child: FormBuilderTextField(
              attribute: "amount",
              keyboardType: TextInputType.number,
              validators: [
                FormBuilderValidators.required(errorText: null),
                FormBuilderValidators.numeric(errorText: null)
              ],
            ),
            width: 64,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              if (_formKey.currentState.saveAndValidate()) {
                Ingredient ing = _formKey.currentState.value["ingredient"];
                int amount = int.parse(_formKey.currentState.value["amount"]);
                widget.onSubmit(ing, amount);
              }
            },
          )
        ]),
      ),
    );
  }
}
