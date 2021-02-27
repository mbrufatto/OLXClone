import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_clone/screens/filter/components/section_title.dart';
import 'package:xlo_clone/stores/filter_store.dart';

class CityField extends StatefulWidget {
  final FilterStore filter;

  CityField(this.filter);

  @override
  _CityFieldState createState() => _CityFieldState();
}

class _CityFieldState extends State<CityField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle("Selecione uma cidade"),
        Observer(builder: (_) {
          if (widget.filter.selectedUF == null ||
              widget.filter.selectedUF.name == 'Todos') return Container();
          return DropdownButtonFormField(
            items: widget.filter.allCityList.length > 0
                ? widget.filter.allCityList
                    .map((e) => DropdownMenuItem(
                          child: Text(e.name),
                          value: e,
                        ))
                    .toList()
                : null,
            onChanged: (selectedCity) {
              widget.filter.setCity(selectedCity);
            },
          );
        }),
      ],
    );
  }
}
