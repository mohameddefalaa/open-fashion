import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';

class Customecirculerbutton extends StatelessWidget {
  const Customecirculerbutton({
    super.key,
    required this.image,
    required this.ontap,
  });
  final String image;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(color: Lightthemcolors.sbbcolor, width: 1),
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: SvgPicture.asset(image, height: 20, width: 20),
        ),
      ),
    );
  }
}
