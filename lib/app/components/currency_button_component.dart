import 'package:flutter/material.dart';
import 'package:money_conversion/app/models/currency_model.dart';

class CurrencyDropButton extends StatelessWidget {
  final List<CurrencyModel>? items;
  final CurrencyModel? selectedItem;
  final TextEditingController? controller;
  final void Function(CurrencyModel? model)? onChanged;

  const CurrencyDropButton(
      {Key? key, this.items, this.controller, this.onChanged, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 60,
            child: DropdownButton<CurrencyModel>(
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              iconSize: 30,
              style: TextStyle(fontSize: 20),
              isExpanded: true,
              value: selectedItem,
              underline: Container(height: 1, color: Colors.amber),
              items: items!
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
