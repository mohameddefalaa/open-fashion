import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/customeAppBar.dart';
import 'package:open_fashion/components/customebutton.dart';
import 'package:open_fashion/components/customerdatacard.dart';
import 'package:open_fashion/components/dilog.dart';
import 'package:open_fashion/components/headersandtexts.dart';
import 'package:open_fashion/components/productcard.dart';
import 'package:open_fashion/components/showtotal.dart';
import 'package:open_fashion/models/productmodel.dart';
import 'package:open_fashion/screens/addshippingadress.dart';
import 'package:open_fashion/screens/paymentmethode.dart';
import 'package:open_fashion/screens/productdetails.dart';

class Placeorder extends StatefulWidget {
  const Placeorder({
    super.key,
    required this.product,
    required this.selectedqty,
  });
  final Productmodel product;
  final int selectedqty;
  @override
  State<Placeorder> createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  /* الميثوددي جديدة وحلوة انا حفظت  */
  dynamic savedadressdata;
  dynamic savevesadata;

  void openadressdadta(context) async {
    final adressdata = await Navigator.push(
      // انا مستني القيمة اللي هترجع تتخزن في ال addresdata
      context,
      MaterialPageRoute(
        builder: (context) {
          return Addshipping();
        },
      ),
    );

    if (adressdata != null) {
      setState(() {
        savedadressdata = adressdata;
      });
    }
  }

  editevisadata() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PaymentMethode(editedtae: savevesadata);
        },
      ),
    );
  }

  void openpaymentdata() async {
    final visadata = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PaymentMethode();
        },
      ),
    );
    if (visadata != null) {
      setState(() {
        savevesadata = visadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(isblack: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header('Checkout', context),
                savedadressdata == null
                    ? Text(
                        'Shipping adress',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          letterSpacing: 1,
                          color: Color(0xff878787),
                        ),
                      )
                    : SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),

                  child: savedadressdata != null
                      ? Customerdatacard(savedadressdata: savedadressdata)
                      : SizedBox.shrink(),
                ),
                Gap(10),
                savedadressdata == null
                    ? selectorbuild(
                        context: context,
                        text: 'Add shipping adress',
                        widget: IconButton(
                          onPressed: () {
                            openadressdadta(context);
                          },
                          icon: Icon(Icons.add),
                          color: Color.fromARGB(255, 192, 191, 191),
                        ),
                      )
                    : SizedBox.shrink(),
                Gap(10),

                savevesadata == null
                    ? selectorbuild(
                        title: 'Shipping Method',
                        context: context,
                        text: 'Pickup at store',
                        widget: Row(
                          children: [
                            Text(
                              'Free'.toUpperCase(),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Gap(10),
                            svgIcon('assets/icons/Down.svg', true),
                          ],
                        ),
                      )
                    : Divider(
                        color: Color.fromARGB(255, 167, 163, 163),
                        thickness: 1,
                      ),

                Gap(10),

                savevesadata == null
                    ? GestureDetector(
                        onTap: () {
                          openpaymentdata();
                        },
                        child: selectorbuild(
                          title: 'Payment method',
                          context: context,
                          text: 'select payment method',
                          widget: svgIcon('assets/icons/Down.svg', true),
                        ),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/MasterCard.svg'),
                              Gap(10),
                              Text(
                                'Master Card ending  ••••${savevesadata['number'].toString().substring(savevesadata['number'].toString().length - 2)}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  editevisadata();
                                },
                                child: svgIcon(
                                  'assets/icons/Forward.svg',
                                  true,
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          Divider(
                            color: Color.fromARGB(255, 167, 163, 163),
                            thickness: 1,
                          ),
                          Productcard(
                            finalqty: selectedqty,
                            product: widget.product,
                            onchange: (v) {
                              setState(() {
                                selectedqty = v;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
          Spacer(),
          ShowTotal(product: widget.product),
          Customebutton(
            isiconshow: true,
            text: savevesadata == null ? 'Place order' : 'Checkout',
            ontap: savevesadata != null
                ? () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Customedilog();
                      },
                    );
                  }
                : () {},
          ),
        ],
      ),
    );
  }
}

Widget selectorbuild({
  String? title,
  required BuildContext context,
  required String text,
  required Widget widget,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title == null ? '' : title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: Color(0xff878787)),
      ),
      Gap(5),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(31, 105, 102, 102),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Color.fromARGB(255, 192, 191, 191),
              ),
            ),
            Spacer(),
            widget,
            Gap(10),
          ],
        ),
      ),
    ],
  );
}
