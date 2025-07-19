import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_fashion/components/customeAppBar.dart';
import 'package:open_fashion/components/customebutton.dart';
import 'package:open_fashion/components/headersandtexts.dart';
import 'package:open_fashion/cubit/appcubit.dart';

class PaymentMethode extends StatefulWidget {
  const PaymentMethode({super.key, this.editedtae});
  final dynamic editedtae;
  @override
  State<PaymentMethode> createState() => _PaymentMethodeState();
}

bool isCvvFocused = false;
String cvvCode = '';
String cardHolderName = '';
String expiryDate = '';
String cardNumber = '';
GlobalKey<FormState> formkey = GlobalKey<FormState>();

class _PaymentMethodeState extends State<PaymentMethode> {
  @override
  void initState() {
    if (widget.editedtae != null) {
      widget.editedtae['cardnumber'] = cardNumber;
      widget.editedtae['name'] = cardHolderName;
      widget.editedtae['cvv'] = cvvCode;
      widget.editedtae['date'] = expiryDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomeAppBar(),
        body: GestureDetector(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                children: [
                  header('Add shipping adress', context),
                  CreditCardWidget(
                    textStyle: GoogleFonts.tenorSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Appcubit.isdark ? Colors.white : Colors.grey,
                    ),
                    cardBgColor: Appcubit.isdark ? Colors.grey : Colors.black,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView:
                        isCvvFocused, //true when you want to show cvv(back) view
                    onCreditCardWidgetChange: (CreditCardBrand brand) {},
                    isHolderNameVisible: true,

                    // Callback for anytime credit card brand is changed
                  ),
                  CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName.toUpperCase(),
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    formKey: formkey,
                  ),
                  Gap(MediaQuery.sizeOf(context).height * 0.095),
                  Customebutton(
                    text: 'Add Card',
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        final data = {
                          'cardnumber': cardNumber,
                          'name': cardHolderName,
                          'cvv': cvvCode,
                          'date': expiryDate,
                        };
                        Navigator.pop(context, data);
                      }
                    },
                    isiconshow: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cvvCode = data.cvvCode;
      cardHolderName = data.cardHolderName;
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      isCvvFocused = data.isCvvFocused;
    });
  }
}
