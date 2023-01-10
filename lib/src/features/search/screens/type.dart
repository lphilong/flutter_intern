import 'package:flutter/material.dart';
import 'package:work/src/common_widgets/checkbox/custom_checkbox.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Search Type",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.only(top: 80),
          child: const CustomCheckBox()),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Colors.black.withOpacity(0.2)))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) => setState(() {
                      isSelected = value!;
                    }),
                  ),
                  const Text('Select All',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
