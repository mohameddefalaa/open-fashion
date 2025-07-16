import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/themes/darkthemecolors.dart';
import 'package:open_fashion/core/themes/lightthemcolors.dart';
import 'package:open_fashion/screens/home.dart';

class Customedilog extends StatefulWidget {
  const Customedilog({super.key});

  @override
  State<Customedilog> createState() => _CustomedilogState();
}

int? selectedindex;
late bool isselected;

class _CustomedilogState extends State<Customedilog> {
  @override
  void initState() {
    isselected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      'assets/icons/Disappointed.svg',
      'assets/icons/Happy.svg',
      'assets/icons/In Love.svg',
    ];
    return Dialog(
      shape: Border.all(color: DarkthemeAppcolors.titleActive),
      clipBehavior: Clip.none,
      backgroundColor: DarkthemeAppcolors.titleActive,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .95,
        height: MediaQuery.sizeOf(context).height * .65,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Gap(30),
              Text(
                'Payment success',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Gap(30),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 52,
                      right: 105,
                      child: SvgPicture.asset(
                        'assets/icons/star2.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),

                    // النجمة اللي فوق على اليمين
                    Center(
                      child: SvgPicture.asset(
                        'assets/icons/done.svg',
                        width: 40,
                        height: 40,
                      ),
                    ),

                    Positioned(
                      bottom: 50,
                      left: 110,
                      child: SvgPicture.asset('assets/icons/small.svg'),
                    ),
                  ],
                ),
              ),
              Gap(30),
              Text(
                'Your payment was success',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  letterSpacing: 0,
                  color: Color.fromARGB(255, 172, 169, 169),
                ),
              ),
              Gap(5),
              Text(
                'Payment ID 260625',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  letterSpacing: 0,
                  fontSize: 15,
                  color: Color.fromARGB(255, 172, 169, 169),
                ),
              ),
              Gap(10),
              SvgPicture.asset("assets/images/12.svg"),
              Gap(10),

              Text(
                'Rate your purchase',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  letterSpacing: 0,
                  color: Color.fromARGB(255, 172, 169, 169),
                ),
              ),
              Gap(10),

              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(icons.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                        isselected = true;
                      });
                    },
                    child: SvgPicture.asset(
                      icons[index],
                      height: 40,
                      width: 40,

                      color: selectedindex == index && isselected
                          ? Color(0xFFC7AA7A)
                          : Color(0xFF8C8C8C),
                    ),
                  );
                }),
              ),
              isselected
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isselected = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFFC7AA7A),

                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Lightthemcolors.iconlightcolor,
                                  ),
                            ),
                            Gap(5),
                            Icon(Icons.send, size: 14),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: MediaQuery.sizeOf(context).width * 0.28,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60),
                      color: DarkthemeAppcolors.titleActive,
                    ),
                    child: Center(
                      child: Text(
                        'Submit'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(fontSize: 16, color: Color(0xffF8F0E7)),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .40,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xffBFA37A),
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontSize: 16, color: Color(0xffF8F0E7)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
