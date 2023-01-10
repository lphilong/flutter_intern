import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/screens/auth.dart';
import 'package:work/src/features/auth/services/api_service.dart';

import '../../../common_widgets/drawer.dart';
import '../widgets/bottom_btn.dart';
import '../widgets/searchItems.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String? token = await ApiHandler.getToken();
    if (token == null) {
      Get.to(() => const AuthenticationScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController priceFromController = TextEditingController();
    TextEditingController priceToController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController bathroomController = TextEditingController();
    TextEditingController bedroomController = TextEditingController();
    TextEditingController builtsizefromController = TextEditingController();
    TextEditingController builtsizetoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SearchItems(
        priceFromController: priceFromController,
        priceToController: priceToController,
        addressController: addressController,
        bathroomController: bathroomController,
        bedroomController: bedroomController,
        builtsizefromController: builtsizefromController,
        builtsizetoController: builtsizetoController,
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const BottomBtn(),
    );
  }
}
