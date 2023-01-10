import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';
import 'package:work/src/features/auth/screens/login.dart';
import 'package:work/src/routing/routes.dart';
import '../../../common_widgets/formField.dart';
import 'owner_search.dart';
import 'search_click.dart';
import '../../../common_widgets/custom_dropdown.dart';

class SearchItems extends GetView<LoginController> {
  SearchItems({
    Key? key,
    required this.priceFromController,
    required this.priceToController,
    required this.addressController,
    required this.bathroomController,
    required this.bedroomController,
    required this.builtsizefromController,
    required this.builtsizetoController,
  }) : super(key: key);

  final TextEditingController priceFromController;
  final TextEditingController priceToController;
  final TextEditingController addressController;
  final TextEditingController bathroomController;
  final TextEditingController bedroomController;
  final TextEditingController builtsizefromController;
  final TextEditingController builtsizetoController;
  final List<String> servicesList = ["zero", "one", "Two", "Three"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(children: [
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: form(
                          'Price From', priceFromController, isEmpty, true)),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.6,
                  ),
                  Expanded(
                      child:
                          form('Price To', priceToController, isEmpty, true)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child:
                          form('Bedrooms', bedroomController, isEmpty, true)),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.6,
                  ),
                  Expanded(
                      child:
                          form('Bathrooms', bathroomController, isEmpty, true)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: form('Built Size From', builtsizefromController,
                          isEmpty, true)),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 0.6,
                  ),
                  Expanded(
                      child: form('Build Size To', builtsizetoController,
                          isEmpty, true)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: form('Address', addressController, isEmpty, false)),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: fieldBtn(context, 'Type', () => Get.toNamed(Routes.type),
                    Icons.menu)),
            const SizedBox(
              height: 20,
            ),
            Obx(() => fieldBtn(
                context,
                controller.dropdownValue.value == "zero"
                    ? 'Country'
                    : controller.dropdownValue.value,
                () => _showDialog(
                    context, 'Select Country', servicesList, 'Country'),
                Icons.menu)),
            const SizedBox(
              height: 20,
            ),
            Obx(() => fieldBtn(
                context,
                controller.dropdownValue.value == "zero"
                    ? 'Province'
                    : controller.dropdownValue.value,
                () => _showDialog(
                    context, 'Select Province', servicesList, 'Province'),
                Icons.menu)),
            const SizedBox(
              height: 20,
            ),
            Obx(() => fieldBtn(
                context,
                controller.dropdownValue.value == "zero"
                    ? 'Area'
                    : controller.dropdownValue.value,
                () => _showDialog(context, 'Select Area', servicesList, 'Area'),
                Icons.menu)),
            const SizedBox(
              height: 20,
            ),
            Obx(() => fieldBtn(
                context,
                controller.dropdownValue.value == "zero"
                    ? 'Location'
                    : controller.dropdownValue.value,
                () => _showDialog(
                    context, 'Select Location', servicesList, 'Location'),
                Icons.menu)),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: fieldBtn(context, 'Must have feature',
                    () => Get.toNamed(Routes.type), Icons.menu)),
            const SizedBox(
              height: 20,
            ),
            const OwnerSearch()
          ])),
    );
  }
}

String? isEmpty(String? text) {
  if (text == null || text.isEmpty) {
    return 'Field is empty!';
  }

  return null;
}

Future _showDialog(
    context, String hintName, List<String> list, String title) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Row(children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          CustomDropDown(hintName: hintName, yourList: list),
          const SizedBox(
            height: 10,
          ),
        ]);
      }));
    },
  );
}
