import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({super.key, required this.isblack});
  final bool isblack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AppBar(
        leadingWidth: 24,
        backgroundColor: isblack
            ? DarkthemeAppcolors.titleActive
            : Lightthemcolors.sbbcolor,
        actions: [
          svgIcon('assets/icons/Search.svg', isblack),
          Gap(20),
          svgIcon('assets/icons/shopping bag.svg', isblack),
        ],
        centerTitle: true,
        title: Image.asset(
          'assets/images/whiteLogo.png',
          width: 78.8,
          height: 32,
        ),
        leading: Builder(
          builder: (BuildContext innerContext) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(innerContext).openDrawer();
              },
              child: svgIcon('assets/icons/Menu.svg', isblack),
            );
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}

Widget svgIcon(String icon, bool isblack) => SvgPicture.asset(
  icon,

  color: isblack
      ? DarkthemeAppcolors.iconColore
      : Lightthemcolors.iconlightcolor,
  height: 24,
  width: 24,
);
