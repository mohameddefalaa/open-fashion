import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart' show Gap;
import 'package:open_fashion/components/customeAppBar.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';
import 'package:open_fashion/cubit/appcubit.dart';

import '../core/themes/darkthemecolors.dart' show DarkthemeAppcolors;

class Customebutton extends StatelessWidget {
  const Customebutton({
    super.key,
    required this.text,
    required this.ontap,
    required this.isiconshow,
  });
  final String text;
  final void Function() ontap;
  final bool isiconshow;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        clipBehavior: Clip.none,

        height: 55,
        width: double.infinity,
        color: Appcubit.isdark
            ? Lightthemcolors.sbbcolor
            : DarkthemeAppcolors.titleActive,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isiconshow
                ? SvgPicture.asset(
                    'assets/icons/shopping bag.svg',
                    color: Appcubit.isdark
                        ? DarkthemeAppcolors.titleActive
                        : Lightthemcolors.sbbcolor,
                  )
                : SizedBox.shrink(),
            Gap(10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16,
                letterSpacing: 1,
                color: Appcubit.isdark
                    ? DarkthemeAppcolors.titleActive
                    : Lightthemcolors.sbbcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
