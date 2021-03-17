import 'dart:async';

import 'package:demo/pages/home_page.dart';
import 'package:demo/services/auth_services.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../property_pages/property_details.dart';
import '../../widget/custom_text_widget.dart';
import 'package:form_validator/form_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class LoginPage extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool isLabel = true;
  String email;
  String password;
  AccessToken _accessToken;
  bool isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  void signInWithMobile() async {
    String number = '+91 9028282374';

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {
        print('success');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('failure');
      },
      codeSent: (String verificationId, int resendToken) {
        print(verificationId);
        print('otp send');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('timeout');
      },
    );
  }

  _loginWithEmail({
    String email,
    String password,
  }) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        Navigator.pushNamed(context, MyHomePage.id);
      }
    } catch (e) {
      print(e);
    }
  }

  _loginWithFB() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        Uri uri = Uri.https('',
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final graphResponse = await http.get(uri);
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => isLoggedIn = false);
        break;
    }
  }

  void _validate() {
    _form.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // bottomOpacity: 0,
        //  toolbarOpacity: 0,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                Icons.clear,
                size: 32,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _form,
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: 'Login / SignIn',
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.redAccent,
              ),
              SizedBox(
                height: 50,
              ),
              Material(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomTextFormFieldWidget(
                  enable: true,
                  onTAP: () {
                    setState(() {
                      isLabel = false;
                    });
                  },
                  prefix: Icon(
                    Icons.email_outlined,
                  ),
                  filled: false,
                  padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                  validator: ValidationBuilder().email().build(),
                  align: TextAlign.center,
                  inputType: TextInputType.emailAddress,
                  border:
                      //OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)),
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                  onChanged: (value) {
                    email = value;
                  },
                  labelText: isLabel == true ? 'Email' : "",
                  hintText: '  Enter your email id',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CustomTextFormFieldWidget(
                  enable: true,
                  onTAP: () {
                    setState(() {
                      isLabel = false;
                    });
                  },
                  align: TextAlign.center,
                  obscureText: true,
                  filled: false,
                  onChanged: (value) {
                    password = value;
                  },
                  padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
                  prefix: Icon(Icons.lock_outlined),
                  inputType: TextInputType.emailAddress,
                  border:
                      //OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none)),
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                  labelText: isLabel == true ? 'password ' : "",
                  hintText: 'enter password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButtonWidget(
                buttonTitle: 'Login',
                minWidth: double.infinity,
                color: Colors.pink,
                onPressFlatButton: () {
                  // print(email);
                  // print(password);
                  _validate();
                  final user = Authontication().loginWithEmail(
                    email: email,
                    password: password,
                  );

                  if (user != null) {
                    Navigator.pushNamed(context, MyHomePage.id);
                  }
                  //  _loginWithEmail(email: email, password: password);
                },
              ),
              FlatButtonWidget(
                buttonTitle: 'SignIn With Facebook',
                minWidth: double.infinity,
                color: Colors.pink,
                onPressFlatButton: () {
                  _loginWithFB();
                  //   signInWithMobile();
                },
              ),
              FlatButtonWidget(
                buttonTitle: 'SignIn With Google',
                minWidth: double.infinity,
                color: Colors.pink,
                onPressFlatButton: () {
                  //_loginWithFB();
                  Authontication().signInWithGoogle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String phoneNumber, verificationId;
//   String otp, authStatus = "";

//   Future<void> verifyPhoneNumber(
//       {BuildContext context, String phoneNumber}) async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       timeout: const Duration(seconds: 30),
//       verificationCompleted: (AuthCredential authCredential) {
//         setState(() {
//           authStatus = "Your account is successfully verified";
//         });
//       },
//       verificationFailed: (FirebaseAuthException authException) {
//         setState(() {
//           authStatus = "Authentication failed";
//         });
//       },
//       codeSent: (String verId, [int forceCodeResent]) {
//         verificationId = verId;
//         setState(() {
//           authStatus = "OTP has been successfully send";
//         });
//         otpDialogBox(context).then((value) {});
//       },
//       codeAutoRetrievalTimeout: (String verId) {
//         verificationId = verId;
//         setState(() {
//           authStatus = "TIMEOUT";
//         });
//       },
//     );
//   }

//   otpDialogBox(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return new AlertDialog(
//             title: Text('Enter your OTP'),
//             content: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   border: new OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(
//                       const Radius.circular(30),
//                     ),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   otp = value;
//                 },
//               ),
//             ),
//             contentPadding: EdgeInsets.all(10.0),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   signIn(otp);
//                 },
//                 child: Text(
//                   'Submit',
//                 ),
//               ),
//             ],
//           );
//         });
//   }

//   Future<void> signIn(String otp) async {
//     await FirebaseAuth.instance
//         .signInWithCredential(PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: otp,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.2,
//             ),
//             Text(
//               "Phone Auth demo📱",
//               style: TextStyle(
//                 color: Colors.cyan,
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Image.network(
//               "https://avatars1.githubusercontent.com/u/41328571?s=280&v=4",
//               height: 150,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 keyboardType: TextInputType.phone,
//                 decoration: new InputDecoration(
//                     border: new OutlineInputBorder(
//                       borderRadius: const BorderRadius.all(
//                         const Radius.circular(30),
//                       ),
//                     ),
//                     filled: true,
//                     prefixIcon: Icon(
//                       Icons.phone_iphone,
//                       color: Colors.cyan,
//                     ),
//                     hintStyle: new TextStyle(color: Colors.grey[800]),
//                     hintText: "Enter Your Phone Number...",
//                     fillColor: Colors.white70),
//                 onChanged: (value) {
//                   phoneNumber = value;
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             RaisedButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30)),
//               onPressed: () => phoneNumber == null
//                   ? null
//                   : verifyPhoneNumber(
//                       context: context, phoneNumber: '+91 9637082374'),
//               child: Text(
//                 "Generate OTP",
//                 style: TextStyle(color: Colors.white),
//               ),
//               elevation: 7.0,
//               color: Colors.cyan,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text("Need Help?"),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Please enter the phone number followed by country code",
//               style: TextStyle(color: Colors.green),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               authStatus == "" ? "" : authStatus,
//               style: TextStyle(
//                   color: authStatus.contains("fail") ||
//                           authStatus.contains("TIMEOUT")
//                       ? Colors.red
//                       : Colors.green),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
