import 'package:cpssoft_crud/app/shared/constant_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> listData;
  final String hintText;
  final EdgeInsetsGeometry? margin;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.listData,
    required this.hintText,
    this.margin,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late final List<String> items;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    items = widget.listData;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 45,
        margin: widget.margin,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              widget.hintText,
              style: TextStyle(color: kBlackColor, fontSize: 13),
            ),
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });

              widget.onChanged(value);
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: kGreyColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 30,
            ),
            dropdownStyleData: DropdownStyleData(maxHeight: 230),
          ),
        ),
      ),
    );
  }
}
