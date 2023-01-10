import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';

class CustomDropDown extends GetView<LoginController> {
  const CustomDropDown({
    super.key,
    required this.hintName,
    required this.yourList,
  });
  final String hintName;
  final List<String> yourList;

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List list) {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (var value in list) {
      dropDownItems.add(DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: const TextStyle(color: Colors.blue),
        ),
      ));
    }

    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            hintText: hintName,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(
                hintName,
                style: const TextStyle(color: Colors.black),
              ),
              value: controller.dropdownValue.value,
              isDense: true,
              onChanged: (String? newValue) {
                controller.dropdownValue.value = newValue!;
                Get.back();
              },
              items: buildDropdownMenuItems(yourList),
            ),
          ),
        );
      },
    );
  }
}
