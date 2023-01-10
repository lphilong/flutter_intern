import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work/src/features/auth/controllers/login_controller.dart';
import 'package:work/src/features/search/screens/search_screen.dart';

class CustomDrawer extends GetView<LoginController> {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 170,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            children: const [
                              CircleAvatar(
                                radius: 30,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  controller.userModel != null
                                      ? '${controller.userModel!.data.lastName}${" "}${controller.userModel!.data.firstName}'
                                      : 'Name',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  controller.userModel != null
                                      ? controller.userModel!.data.email
                                      : 'Email',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text(' Home '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text("Properties"),
              leading: const Icon(Icons.home),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text("Last Result"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Search"),
                  onTap: () {
                    Get.to(() => const SearchScreen());
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.people_alt_outlined),
              title: const Text(' Contacts '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_center_outlined),
              title: const Text(' Tasks '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text("AMS"),
              leading: const Icon(Icons.message_outlined),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text("View Messages"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Last AMS Messages"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Send Messages"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Preferences"),
                  onTap: () {},
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
