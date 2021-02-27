import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/filter/components/section_title.dart';
import 'package:xlo_clone/stores/filter_store.dart';

class CityField extends StatelessWidget {
  final FilterStore filter;

  CityField(this.filter);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Selecione uma cidade"),
        Observer(builder: (_) {
          if (filter.selectedUF == null || filter.selectedUF.name == 'Todos')
            return Container();
          return DropdownButtonFormField(
            value: filter.selectedCity,
            items: filter.allCityList.length > 0
                ? filter.allCityList
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList()
                : null,
            onChanged: (selectedCity) {
              filter.setCity(selectedCity);
            },
          );
        }),
      ],
    );
  }
}
