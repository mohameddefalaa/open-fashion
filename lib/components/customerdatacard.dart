import 'package:flutter/material.dart';
import 'package:open_fashion/screens/addshippingadress.dart';

class Customerdatacard extends StatefulWidget {
  const Customerdatacard({super.key, required this.savedadressdata});
  final dynamic savedadressdata;

  @override
  State<Customerdatacard> createState() => _CustomerdatacardState();
}

class _CustomerdatacardState extends State<Customerdatacard> {
  void editdata() async {
    final newadress = await Navigator.push(
      // انا مستني القيمة اللي هترجع تتخزن في ال addresdata
      context,
      MaterialPageRoute(
        builder: (context) {
          return Addshipping(editdata: widget.savedadressdata);
        },
      ),
    );
    if (widget.savedadressdata != null) {
      setState(() {
        widget.savedadressdata == newadress;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildAdressdata(
          context: context,
          name:
              "${widget.savedadressdata['first']} ${widget.savedadressdata['last']}",
          adress: widget.savedadressdata['adress'],
          zipcity:
              "${widget.savedadressdata['state']} ${widget.savedadressdata['zipcode']}",
          phone: widget.savedadressdata['phone'],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            editdata();
          },
          icon: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    );
  }
}

@override
Widget buildAdressdata({
  required BuildContext context,
  required String phone,
  required String zipcity,
  required String adress,
  required String name,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(letterSpacing: 1),
      ),
      Text(adress, style: Theme.of(context).textTheme.titleMedium),
      Text(zipcity, style: Theme.of(context).textTheme.titleMedium),
      Text(phone, style: Theme.of(context).textTheme.titleMedium),
    ],
  );
}
