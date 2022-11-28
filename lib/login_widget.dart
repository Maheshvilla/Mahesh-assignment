// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Signin into your",
                  style: TextStyle(
                      fontSize: 24,
                      color: Common().bagrouncolor,
                      fontWeight: FontWeight.bold)),
            ])),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Accept",
                  style: TextStyle(
                      fontSize: 24,
                      color: Common().bagrouncolor,
                      fontWeight: FontWeight.bold)),
            ])),
            SizedBox(
              height: 80,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Email",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ])),
            TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.email),
                labelText: 'Email *',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Password",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ])),
            TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.lock),
                labelText: 'Password *',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Forgot Password ?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Common().bagrouncolor,
                        fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap =  () {
                    }
                ),
              ])),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Login with",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                  )),
              ])),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png')
                    )
                  ),
                ),
                SizedBox(width: 40,),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://www.freepnglogos.com/uploads/facebook-logo-icon/facebook-logo-icon-facebook-logo-png-transparent-svg-vector-bie-supply-16.png')
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
