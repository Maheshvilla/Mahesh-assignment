// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common.dart';
import 'package:flutter_application_1/main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpWidget extends StatefulWidget {
   SignUpWidget({Key? key,}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {



  bool value = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Form(
          key:formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Create an",
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
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Name",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ])),
              TextFormField(
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.person),
                  labelText: 'John doe',
                ),
                onSaved: (String? value) {},
                validator: Common().validateName,
              ),
              SizedBox(
                height: 10,
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
                  labelText: 'Email',
                ),
                onSaved: (String? value) {},
                validator: Common().validateEmail,
              ),
              SizedBox(height:10,),
              RichText(text: TextSpan(children: [
                TextSpan(
                  text: "Contact No",
                  style: TextStyle(fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold) 
                ),
        
              ])),
              IntlPhoneField(
            decoration: InputDecoration(
          labelText: 'Phone Number',
          
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {
          print(phone.completeNumber);
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
                  labelText: '..........',
                ),
                onSaved: (String? value) {},
                validator: (String? value) {},
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Checkbox(
                   checkColor: Common().bagrouncolor, 
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(children: [
                    TextSpan(text: 'I agree with',style: TextStyle(color:Colors.black)),
                  TextSpan(
                      text: " terms & conditions",
                      style: TextStyle(
                          fontSize: 16,
                          color: Common().bagrouncolor,
                          fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap =  () {
                      }
                  ),
                ])),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
