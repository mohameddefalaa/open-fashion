import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';
import 'package:open_fashion/cubit/appcubit.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AppBar(
        leadingWidth: 24,
        backgroundColor: Appcubit.isdark
            ? DarkthemeAppcolors.titleActive
            : Lightthemcolors.sbbcolor,
        actions: [
          svgIcon('assets/icons/Search.svg'),
          Gap(20),

          DayNightSwitcher(
            dayBackgroundColor: Lightthemcolors.sbbcolor,
            nightBackgroundColor: DarkthemeAppcolors.titleActive,
            isDarkModeEnabled: Appcubit.isdark, // متغير بولين عندك
            onStateChanged: (newValue) {
              Appcubit.get(context).changetheme(newValue);
            },
          ),
        ],
        centerTitle: true,
        title: Appcubit.isdark
            ? Image.asset(
                'assets/images/whiteLogo.png',
                width: 78.8,
                height: 32,
              )
            : SvgPicture.asset("assets/icons/lightLogo.svg"),
        leading: Builder(
          builder: (BuildContext innerContext) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(innerContext).openDrawer();
              },
              child: svgIcon('assets/icons/Menu.svg'),
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

Widget svgIcon(String icon) => SvgPicture.asset(
  icon,

  color: Appcubit.isdark
      ? DarkthemeAppcolors.iconColore
      : Lightthemcolors.iconlightcolor,

  height: 24,
  width: 24,
);
