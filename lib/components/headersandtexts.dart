import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/cubit/appcubit.dart';

Widget header(String header, BuildContext context) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(20),
        Text(header, style: Theme.of(context).textTheme.bodyLarge),
        Gap(10),
        Appcubit.isdark
            ? SvgPicture.asset('assets/images/12.svg')
            : SvgPicture.asset('assets/icons/3.svg'),
        Gap(10),
      ],
    ),
  );
}
