import 'package:flutter/material.dart';
import 'package:open_fashion/cubit/appcubit.dart';
import 'package:open_fashion/models/productmodel.dart';
import 'package:open_fashion/screens/productdetails.dart';

class ShowTotal extends StatelessWidget {
  const ShowTotal({super.key, required this.product});
  final Productmodel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        'total'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 14,
          letterSpacing: 3,
          color: Appcubit.isdark
              ? Color.fromARGB(255, 167, 163, 163)
              : Color(0xff333333),
        ),
      ),
      trailing: Text(
        "\$${selectedqty * product.price}",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Color(0xffDD8560),
          fontSize: 16,
        ),
      ),
    );
  }
}
