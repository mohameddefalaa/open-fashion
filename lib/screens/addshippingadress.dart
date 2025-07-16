import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/customeAppBar.dart';
import 'package:open_fashion/components/customebutton.dart';
import 'package:open_fashion/components/customrtextfiled.dart';
import 'package:open_fashion/components/headersandtexts.dart';

class Addshipping extends StatefulWidget {
  const Addshipping({super.key, this.editdata});
  final dynamic editdata;
  @override
  State<Addshipping> createState() => _AddshippingState();
}

class _AddshippingState extends State<Addshipping> {
  @override
  void initState() {
    if (widget.editdata != null) {
      firstnamecontroller.text = widget.editdata['first'];
      lastnamecontroller.text = widget.editdata['last'];
      adresscontroller.text = widget.editdata['adress'];
      statecontroller.text = widget.editdata['state'];
      zipcontroller.text = widget.editdata['zipcode'];
      phonecontroller.text = widget.editdata['phone'];
    }
    super.initState();
  }

  @override
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController zipcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(isblack: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),

                child: Column(
                  children: [
                    header('Add shipping adress', context),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfailed(
                            typee: TextInputType.text,
                            controller: firstnamecontroller,
                            hint: 'First Namee',
                            label: 'First Name',
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: CustomTextfailed(
                            typee: TextInputType.text,

                            controller: lastnamecontroller,
                            label: 'Last Name',
                            hint: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    CustomTextfailed(
                      typee: TextInputType.text,

                      controller: adresscontroller,
                      hint: 'adress',
                      label: 'write your adress',
                    ),
                    Gap(10),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfailed(
                            typee: TextInputType.text,

                            controller: statecontroller,
                            hint: 'State',
                            label: 'write your state',
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: CustomTextfailed(
                            typee: TextInputType.number,

                            controller: zipcontroller,
                            label: 'ZipCode',
                            hint: 'Zio code ',
                          ),
                        ),
                      ],
                    ),
                    CustomTextfailed(
                      typee: TextInputType.number,

                      controller: phonecontroller,
                      hint: 'Phone',
                      label: 'write your phone ',
                    ),
                    Gap(10),
                  ],
                ),
              ),
              Gap(MediaQuery.sizeOf(context).height * 0.36),
              Customebutton(
                isiconshow: false,
                text: 'Add now',
                ontap: () {
                  FocusScope.of(context).unfocus();

                  if (formkey.currentState!.validate()) {
                    final data = {
                      'first': firstnamecontroller.text,
                      'last': lastnamecontroller.text,
                      'adress': adresscontroller.text,
                      'phone': phonecontroller.text,
                      'zipcode': zipcontroller.text,
                      'state': statecontroller.text,
                    };
                    Navigator.pop(context, data);
                  } else {
                    null;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
