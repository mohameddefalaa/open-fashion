import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/components/customeAppBar.dart';
import 'package:open_fashion/components/dilog.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';
import 'package:open_fashion/cubit/appcubit.dart';
import 'package:open_fashion/models/productmodel.dart';
import 'package:open_fashion/screens/productdetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? selecteditem;
  bool ishere = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: DarkthemeAppcolors.titleActive,

        width: 200,
        child: ListView(
          children: [
            DrawerHeader(child: Text('Menu')),
            ListTile(title: Text('Item 1')),
            ListTile(
              title: Text(
                'Item 2',
                style: GoogleFonts.tenorSans(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: CustomeAppBar(),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/images/10.svg'),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Appcubit.isdark
                ? SvgPicture.asset('assets/images/October.svg')
                : SvgPicture.asset(
                    'assets/images/October.svg',
                    color: Color.fromARGB(255, 99, 98, 98),
                  ),
          ),

          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: Appcubit.isdark
                ? SvgPicture.asset('assets/images/Collection.svg')
                : SvgPicture.asset(
                    'assets/images/Collection.svg',
                    color: Color.fromARGB(255, 99, 98, 98),
                  ),
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: .0),
              child: Column(
                children: [
                  Gap(120),
                  Image.asset('assets/images/cover.png'),
                  Gap(20),
                  GridView.builder(
                    itemCount: productslist.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 0,
                      childAspectRatio: .53,
                    ),
                    itemBuilder: (context, index) {
                      final product = productslist[index];
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selecteditem = index;

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return Productdetails();
                                //     },
                                //   ),
                                // );
                              });
                            },

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(product.image),
                                Gap(10),

                                selecteditem == index
                                    ? SizedBox.shrink()
                                    : Text(
                                        maxLines: 1,
                                        product.title,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                Gap(3),
                                Text(
                                  product.desc,
                                  maxLines: 1,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        fontSize: 12,
                                        color: Color(0xff7D7D7D),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                                selecteditem == index ? Gap(20) : Gap(8),
                                Text(
                                  "\$${product.price} ",
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Color(0xffDD8560),
                                        fontSize: 15,
                                      ),
                                ),
                              ],
                            ),
                          ),

                          if (selecteditem == index)
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 50,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Productdetails(product: product);
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 165,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Appcubit.isdark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    color: Appcubit.isdark
                                        ? DarkthemeAppcolors.titleActive
                                        : Lightthemcolors.sbbcolor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      svgIcon('assets/icons/shopping bag.svg'),
                                      Gap(10),
                                      Text(
                                        'Order Now',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Gap(10),
                        ],
                      );
                    },
                  ),
                  Gap(10),
                  Text(
                    "You may also like",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 18),
                  ),
                  Gap(15),
                  SvgPicture.asset(
                    'assets/images/12.svg',
                    width: 124.95879364013672,
                    height: 9.254290580749512,
                  ),
                  Gap(30),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: menproductslist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final product = menproductslist[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              product.image,
                              height: 300,
                              width: 254,
                              fit: BoxFit.contain,
                            ),
                            Gap(10),
                            Text(
                              maxLines: 1,
                              product.title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 340,
                    width: double.infinity,
                    color: Lightthemcolors.sbbcolor,
                    child: Column(
                      children: [
                        Gap(30),
                        Center(
                          child: SizedBox(
                            height: 24,
                            width: 162,
                            child: Row(
                              children: [
                                Image.asset('assets/icons/Twitter.png'),
                                Spacer(),
                                Image.asset('assets/icons/Instagram.png'),
                                Spacer(),
                                Image.asset('assets/icons/youtube.png'),
                              ],
                            ),
                          ),
                        ),
                        Gap(30),
                        Image.asset('assets/images/8.png'),
                        Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'mohameddefalla@openui.design',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Color(0xff333333)),
                            ),

                            Gap(5),
                            Text(
                              '+201000650588',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Color(0xff333333)),
                            ),

                            Gap(5),

                            Text(
                              '8:00 - 22:00 - Everyday',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Color(0xff333333)),
                            ),
                            Gap(30),
                            Image.asset('assets/images/8.png'),
                            Gap(20),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0),
                          child: Row(
                            children: [
                              Text(
                                'About',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                    ),
                              ),
                              Spacer(),
                              Text(
                                'Contact',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                    ),
                              ),
                              Spacer(),
                              Text(
                                'Blog',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Gap(30),
                        Container(
                          color: Color(0xffC4C4C4),
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Copyright© MohamedDefalaa All Rights Reserved.',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Color(0xff555555),
                                    fontSize: 13,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//+60 825 8760\n