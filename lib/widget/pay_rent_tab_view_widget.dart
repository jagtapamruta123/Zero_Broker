import 'package:demo/widget/custom_text_form_field.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeRentTabViewWidget extends StatelessWidget {
  const HomeRentTabViewWidget({
    Key key,
    @required this.onCheck,
    @required this.isCreditInfoAccepted,
    @required this.onPressGetStartedButton,
  }) : super(key: key);

  final bool isCreditInfoAccepted;
  final Function onCheck;
  final onPressGetStartedButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          label: 'your name',
          icon: Icon(
            Icons.person,
            size: 15,
          ),
        ),
        CustomTextFormField(
          label: 'phone Number',
          icon: Icon(
            Icons.phone,
            size: 15,
          ),
        ),
        CustomTextFormField(
          label: 'your email address',
          icon: Icon(
            Icons.email,
            size: 15,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.fromLTRB(14, 0, 0, 50),
                child: Checkbox(
                  value: isCreditInfoAccepted,
                  onChanged: onCheck,
                  // (bool value) {
                  //   isCreditInfoAccepted = value;
                  // },
                ),
              ),
              Expanded(
                // margin: EdgeInsets.fromLTRB(0, 14, 10, 0),
                child: Text(
                  'You hereby consent to ZeroBroker receiveing your Credit Information from Experian for facilitatong such credit information to you as sa value add feature when you see ZeroBroker\'s Service.It will not impact your score.',
                  maxLines: 6,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
        ),
        FlatButtonWidget(
          color: Colors.pink,
          //  isCreditInfoAccepted ? Colors.pink : Colors.pink[50],
          // isCreditInfoAccepted: isCreditInfoAccepted,
          onPressFlatButton: onPressGetStartedButton,

          minWidth: double.infinity,

          buttonTitle: 'get Started',
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
          child: Container(
            height: 60,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue[50],
            ),
            //color: Colors.orange[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Icon(
                    Icons.surround_sound_sharp,
                    color: Colors.blue[200],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '24/7 Instant Transfers',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          letterSpacing: 0.3,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Expanded(
                        child: Container(
                          height: 15,
                          width: 200,
                          child: Text(
                            'Your payment will be transferred instamntly to your\'s account*',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 0.8,
                ),
                Icon(
                  Icons.atm_rounded,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 250,
          // color: Colors.blue[50],
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [Colors.blue[50], Colors.white]),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.blue[50],
            //     blurRadius: 5.0,
            //   ),
            //],
          ),
          margin: EdgeInsets.fromLTRB(15, 20, 5, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                child: CustomTextWidget(
                  title: 'Earn money with Broker Pay',
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 5, 0),
                child: CustomTextWidget(
                  title:
                      'Start paying rent using your credit card and earn miles,cashback and reward points.',
                  fontSize: 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Container(
                  height: 65,
                  width: 320,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[50],
                      border: Border.all(
                        color: Colors.blue,
                      )),
                  //color: Colors.orange[50],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 5, 0),
                        child: Icon(
                          Icons.bubble_chart,
                          color: Colors.blue[200],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 25,
                        width: 200,
                        child: Text(
                          'You can earn upto  30000* by just paying rent for a year by using your credit card',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(25, 20, 10, 0),
                child: Text(
                  '*This is calculated assuming ban annual rent of 4.5 Lacks on Club Vistara SBI card PRIME(premium) ',
                  style: TextStyle(fontSize: 7),
                ),
              ),

              //;;;;;;;;;;;;;;;;;;;;;start from here''''''''''''''''''
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 600,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [Colors.pink[100], Colors.white],
            ),
          ),
          // color: Colors.pink[100],
          child: Column(
            children: [
              PaymentStepCardWidget(
                number: '1',
                title: 'Fill Transaction Details',
                subtitle:
                    'Provide yours benificiary bank details ,and we will setup your account',
              ),
              PaymentStepCardWidget(
                number: '2',
                title: 'Make Payment',
                subtitle: 'make payment through your credit card or debit card',
              ),
              PaymentStepCardWidget(
                number: '3',
                title: 'Payment Credited',
                subtitle:
                    'Your payment is credited to your benificiary bank account within 2 working days',
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(100, 20, 0, 0),
          child: CustomTextWidget(
            title: 'Hear it From Our Customers',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(88, 3, 0, 0),
          child: CustomTextWidget(
            title: 'Testimonials from our ZeroBroker Pay Customers',
            fontSize: 8,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 320,
          // width: double.infinity,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.pink[100], Colors.white],
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '"  I am really excite about using ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'ZEROBroker Pay.',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: ' I had paid my house rent through my credit card.The The entire process is so seamless.My landlord too got an instant notification.' +
                                    'ZEROBROKER people claim they will credit the amount within 48 hrs, mine got credited under 7 hrs."'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              //backgroundImage:ImageProvider<dynamic>()
                              //  Image.network(
                              //     'https://in.pinterest.com/pin/44473115054533313/'),
                              ),
                          SizedBox(
                            width: 6,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amruta Jagtap',
                                style: TextStyle(fontSize: 10),
                              ),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                itemSize: 10,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  //size: 2,
                                  color: Colors.pink,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          )
                        ],
                      )
                      // Icon(Icons.arrow_forward)
                    ],
                  ),
                ),
              );
            },
            viewportFraction: 0.8,
            itemCount: 3,
            autoplay: false,
            itemWidth: 300,
            itemHeight: 350,
            layout: SwiperLayout.TINDER,
            pagination: new SwiperPagination(),
            control: new SwiperControl(
                // iconNext: IconData(0xe5af,
                //     fontFamily: 'MaterialIcons',
                //     matchTextDirection: true),
                ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 25, 0, 10),
          child: Center(
            child: CustomTextWidget(
              title: 'Frequently Asked Questions',
            ),
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            //  scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (BuildContext context, int count) {
              return QuestionAnsExpandedWidget(
                  que: 'How secure zERO broker PAY?',
                  ans: 'Security is incredibly important to us, therefore' +
                      'when you pay on our website ,we use sofisticated security' +
                      'measure to ensure your confidential information is secure' +
                      'and encrypted.Zero broker pay');
            },
          ),
        ),
      ],
    );
  }
}
