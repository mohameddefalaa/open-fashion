import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/customeAppBar.dart';
import 'package:open_fashion/components/customebutton.dart' show Customebutton;
import 'package:open_fashion/components/headersandtexts.dart';
import 'package:open_fashion/components/productcard.dart';
import 'package:open_fashion/components/showtotal.dart';
import 'package:open_fashion/models/productmodel.dart';
import 'package:open_fashion/screens/Placeorder.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key, required this.product});
  final Productmodel product;

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

int selectedqty = 1;

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                header('Checkout'.toUpperCase(), context),

                Productcard(
                  product: widget.product,
                  finalqty: selectedqty,
                  onchange: (v) {
                    setState(() {
                      selectedqty = v;
                    });
                  },
                ),
                Gap(20),
                Divider(
                  color: Color.fromARGB(255, 167, 163, 163),
                  thickness: 1,
                ),
                ListTile(
                  leading: svgIcon('assets/icons/Voucher.svg'),
                  title: Text(
                    'Add promo code',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: Color.fromARGB(255, 167, 163, 163),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 167, 163, 163),
                  thickness: 1,
                ),

                ListTile(
                  leading: svgIcon('assets/icons/Door to Door Delivery.svg'),
                  title: Text(
                    'Delivery',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: Color.fromARGB(255, 167, 163, 163),
                    ),
                  ),
                  trailing: Text(
                    'Free',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      color: Color.fromARGB(255, 167, 163, 163),
                    ),
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 167, 163, 163),
                  thickness: 1,
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                //   child: Row(
                //     children: [
                //       svgIcon('assets/icons/Voucher.svg', true),
                //       Gap(10),
                //       Text(
                //         'Add promo code',
                //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                //           fontSize: 14,
                //           color: Color.fromARGB(255, 167, 163, 163),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Spacer(),
          ShowTotal(product: widget.product),
          Gap(10),
          Customebutton(
            isiconshow: true,
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Placeorder(
                      product: widget.product,
                      selectedqty: selectedqty,
                    );
                  },
                ),
              );
            },
            text: 'Checkout',
          ),
        ],
      ),
    );
  }
}
