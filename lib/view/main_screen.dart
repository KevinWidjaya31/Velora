import 'package:ecommerce/controllers/navigation_controller.dart';
import 'package:ecommerce/controllers/theme_controller.dart';
import 'package:ecommerce/view/account_screen.dart';
import 'package:ecommerce/view/home_screen.dart';
import 'package:ecommerce/view/shopping_screen.dart';
import 'package:ecommerce/view/wishlist_screen.dart';
import 'package:ecommerce/view/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();
    return GetBuilder<ThemeController>(
      builder: (ThemeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: const [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavbar(),
      ),
    );
  }
}
