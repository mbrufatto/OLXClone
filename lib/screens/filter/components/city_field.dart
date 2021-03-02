import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/filter/components/section_title.dart';
import 'package:xlo_clone/stores/filter_store.dart';

class CityField extends StatelessWidget {
  final FilterStore filter;

  CityField(this.filter);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Observer(builder: (_) {
            if (filter.selectedUF == null || filter.selectedUF.name == 'Todos')
              return Container();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle('Selecione uma cidade:'),
                DropdownButtonFormField(
                  isExpanded: true,
                  value: filter.currentCity,
                  items: filter.cityList
                      .map((e) => DropdownMenuItem(
                            child: Text(e.name),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (selectedCity) {
                    filter.setCity(selectedCity);
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
