import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:recepies/model/recepie_store.dart';

import 'package:recepies/entities/recepie.dart';

import 'package:recepies/ui/recepie_details.dart';

class RecepieList extends StatelessWidget {
  final List<SmallRecepie> recepies;
  RecepieList(this.recepies, {Key key}) : super(key: key);

  final _store = GetIt.I<RecepieStore>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recepies.length,
      itemBuilder: (context, i) {
        var recepie = recepies[i];

        return RecepieCard(recepie, _store.selected);
      },
    );
  }
}

class RecepieCard extends StatelessWidget {
  RecepieCard(this.recepie, this.selected, {Key key}) : super(key: key);

  final SmallRecepie recepie;
  final ObservableMap<SmallRecepie, int> selected;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var isSelected = selected.containsKey(recepie);
      return ListTile(
        title: Text(recepie.title),
        trailing: isSelected
            ? _NumberEntry(
                value: selected[recepie],
                onChange: (newAmount) {
                  if (newAmount == 0) {
                    selected.remove(recepie);
                  } else {
                    selected[recepie] = newAmount;
                  }
                })
            : null,
        onTap: () => isSelected ? selected[recepie]++ : selected[recepie] = 1,
        onLongPress: () => GetIt.I<RecepieStore>()
            .getFullRecepie(recepie)
            .then((r) => Navigator.push<void>(context, MaterialPageRoute(builder: (_) => RecepieDetails(r)))),
      );
    });
  }
}

class _NumberEntry extends HookWidget {
  final int value;
  final Function(int) onChange;

  _NumberEntry({Key key, this.value, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    controller.text = value.toString();
    return Container(
      width: 160,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.remove), onPressed: () => onChange(value - 1)),
          Container(
            child: TextField(
              controller: controller,
              onSubmitted: (val) => onChange(int.parse(val)),
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            ),
            width: 64,
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () => onChange(value + 1)),
        ],
      ),
    );
  }
}
