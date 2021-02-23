import 'package:demo/model/bottom_sheet_model.dart';
import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentalAgreementPage extends StatefulWidget {
  static String id = 'rental_agreemet';
  @override
  _RentalAgreementPageState createState() => _RentalAgreementPageState();
}

class _RentalAgreementPageState extends State<RentalAgreementPage> {
  int _currentIndex = 0;
  String _selectCity;
  String mobileNumber = '9637082374';
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.mode_sharp,
                color: Colors.white,
                size: 20,
              ),
              radius: 14,
              backgroundColor: Colors.pink[400],
            ),
            SizedBox(
              width: 7,
            ),
            RichText(
              // locale: ,
              text: TextSpan(
                text: 'ZERO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                    letterSpacing: 0.5),
                children: [
                  TextSpan(
                    text: ' Broker',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.5,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '  (legal services)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        letterSpacing: 0.5,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.yellow[800],
              child: CircleAvatar(
                radius: 10.5,
                backgroundColor: Colors.yellow[200],
                child: CircleAvatar(
                  radius: 9,
                  child: Text(
                    'N',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.yellow[800],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.pink[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          value: _selectCity,
                          //elevation: 5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),

                          items: <String>[
                            'Pune',
                            'Noida',
                            'Faridabad',
                            'Nagpur',
                            'Solapur',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            " Select City ",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          onChanged: (String value) {
                            setState(() {
                              _selectCity = value;
                            });
                          },
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: PressToCallRentalAgreementPage(
                          mobileNumber: mobileNumber,
                          onTap: () => {_service.call(mobileNumber)},
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CustomTextWidget(
                        title: 'Online Rental Agreement',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: CustomTextWidget(
                      title: 'Best online agreement service in benglore',
                      fontSize: 10,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      // controller: ,
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        height: 200,
                        width: 330,
                        child: Card(
                          margin: EdgeInsets.fromLTRB(20, 20, 30, 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                                title: Text(
                                  'Doorstep Delivery',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  'Zero contact document delivery.No need to step out of home',
                                  maxLines: 5,
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: CircleAvatar(
                                  child: Icon(
                                    Icons.watch,
                                  ),
                                )),
                          ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              backgroundColor: destination.color,
              title: Text(destination.title));
        }).toList(),
      ),
    );
  }
}

class PressToCallRentalAgreementPage extends StatelessWidget {
  PressToCallRentalAgreementPage({
    Key key,
    @required this.mobileNumber,
    @required this.onTap,
  }) : super(key: key);

  final String mobileNumber;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: Colors.pink,
          ),
        ),
        margin: EdgeInsets.fromLTRB(5, 18, 10, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.phone,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                mobileNumber,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
