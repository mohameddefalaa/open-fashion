import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

Widget header(String header, BuildContext context) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(20),
        Text(header, style: Theme.of(context).textTheme.bodyLarge),
        Gap(10),
        SvgPicture.asset('assets/images/12.svg'),
        Gap(10),
      ],
    ),
  );
}
