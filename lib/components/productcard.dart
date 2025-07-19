import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';
import 'package:open_fashion/models/productmodel.dart';

class Productcard extends StatefulWidget {
  const Productcard({
    super.key,
    required this.product,
    required this.onchange,
    required this.finalqty,
  });
  final Productmodel product;
  final Function(int) onchange;
  final int finalqty;
  @override
  State<Productcard> createState() => _ProductcardState();
}

late int count;

class _ProductcardState extends State<Productcard> {
  @override
  void initState() {
    count = 1;
    count = widget.finalqty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          widget.product.image,
          height: 150,
          width: 100,
          fit: BoxFit.cover,
        ),
        Gap(5),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  widget.product.desc,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    letterSpacing: 2,
                    color: Color.fromARGB(255, 167, 163, 163),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (count == 1) {
                            count = count;
                          } else {
                            count = count - 1;
                            widget.onchange(count);
                          }
                        });
                      },
                      icon: Icon(CupertinoIcons.minus_circle, size: 22),
                    ),
                    Text(
                      count.toString(),
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count = count + 1;
                          widget.onchange(count);
                        });
                      },
                      icon: Icon(CupertinoIcons.plus_circle, size: 22),
                    ),
                  ],
                ),
                Text(
                  widget.product.price.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Color(0xffDD8560),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
