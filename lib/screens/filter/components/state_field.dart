import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/filter/components/section_title.dart';
import 'package:xlo_clone/stores/filter_store.dart';

class StateField extends StatelessWidget {
  final FilterStore filter;

  StateField(this.filter);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionTitle('Selecione um estado:'),
      Observer(builder: (_) {
        return DropdownButtonFormField(
          isExpanded: true,
          value: filter.selectedUF,
          items: filter.stateList
              .map((e) => DropdownMenuItem(
                    child: Text(e.name),
                    value: e,
                  ))
              .toList(),
          onChanged: (selectedState) {
            filter.getCityList(selectedState);
          },
        );
      }),
    ]);
  }
}
