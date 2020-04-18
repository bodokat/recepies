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
              ...field.value.entries.map((e) => IngredientRow(
                    onChange: (ing, amount) {
                      field.value.remove(e.key);
                      field.value[ing] = amount;
                      field.didChange(field.value);
                    },
                    delete: () {
                      field.value.remove(e.key);
                      field.didChange(field.value);
                    },
                  )),
              IngredientRow(
                onChange: (ing, amount) {
                  field.value[ing] = amount;
                  field.didChange(field.value);
                },
              )
            ],
            shrinkWrap: true,
          ),
        ),
        initialValue: Map<Ingredient, int>(),
        validators: [FormBuilderValidators.required()],
      );
}

class IngredientRow extends StatefulWidget {
  const IngredientRow({
    Key key,
    @required this.onChange,
    this.delete,
  }) : super(key: key);

  final void Function(Ingredient, int) onChange;
  final VoidCallback delete;

  @override
  _IngredientRowState createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  var _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      onChanged: (val) {
        print("Changed");
        widget.onChange(val["ingredient"], int.parse(val["amount"]));
      },
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
          IconButton(icon: Icon(Icons.remove), onPressed: widget.delete ?? _formKey.currentState.reset)
        ]),
      ),
    );
  }
}
