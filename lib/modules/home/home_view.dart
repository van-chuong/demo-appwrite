import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/home/home_controller.dart';
import 'package:mobile_app/widget/side_menu_widget.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import '../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: controller.sideMenuKey,
      type: SideMenuType.shrikNRotate,
      menu: buildMenu(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Demo AppWrite"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              controller.openCloseSideMenu();
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            return DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Created At')),
                DataColumn(label: Text('Updated At')),
              ],
              rows: controller.trashTypeList.value.map((trashType) {
                return DataRow(cells: [
                  DataCell(Text(trashType.name)),
                  DataCell(Text(trashType.createdAt)),
                  DataCell(Text(trashType.updatedAt)),
                ]);
              }).toList(),
            );
          }),
        ),

      ),

    );
  }
  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22.0,
                ),
                SizedBox(height: 16.0),
                Obx(() => Text(
                  controller.isLoading.value ? "User" : controller.currentUser!.name,
                  style: TextStyle(color: Colors.white),
                )),
                Obx(() => Text(
                  controller.isLoading.value ? "" : controller.currentUser!.email,
                  style: TextStyle(color: Colors.white),
                )),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(Routes.home);
            },
            leading: const Icon(Icons.home, size: 20.0, color: Colors.white),
            title: const Text("Home"),
            textColor: Colors.white,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.verified_user,
                size: 20.0, color: Colors.white),
            title: const Text("Profile"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.monetization_on,
                size: 20.0, color: Colors.white),
            title: const Text("Wallet"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.shopping_cart,
                size: 20.0, color: Colors.white),
            title: const Text("Cart"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading:
            const Icon(Icons.star_border, size: 20.0, color: Colors.white),
            title: const Text("Favorites"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {
              controller.logout();
            },
            leading:
            const Icon(Icons.logout, size: 20.0, color: Colors.white),
            title: const Text("LogOut"),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
