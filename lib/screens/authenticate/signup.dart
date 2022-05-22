import 'package:e_commerce_app/services/authService.dart';
import 'package:e_commerce_app/shared/validate_email.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;

  const SignUpPage({required this.toggleView});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  String? email, password, username, phoneNO;
  bool obsureText = true;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _isloading == true
                ? load()
                : Column(
                    children: [
                      Container(
                        height: 500.h,
                        child: Center(
                            child: Text(
                          'Sign Up',
                          style: authText(),
                        )),
                      ),
                      TextFormField(
                        onChanged: (value) => username = value,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Username must be more than 6 characters';
                          } else if (value.isEmpty) {
                            return 'Username Field cant be empty';
                          }
                        },
                        decoration: textFormFieldDecoration()
                            .copyWith(hintText: 'User Name'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormField(
                        onChanged: (value) => this.email = value,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => value!.isEmpty
                            ? 'Email Field cant be empty'
                            : validateEmail(value, context),
                        textInputAction: TextInputAction.next,
                        decoration: textFormFieldDecoration()
                            .copyWith(hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormField(
                        onChanged: (value) => this.password = value,
                        obscureText: obsureText,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Password must be more than 6 characters';
                          } else if (value.isEmpty) {
                            return 'Password Field cant be empty';
                          }
                        },
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: textFormFieldDecoration().copyWith(
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obsureText = !obsureText;
                                  });
                                  FocusScope.of(context).unfocus();
                                },
                                child: Icon(obsureText == true
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      TextFormField(
                        onChanged: (value) => this.phoneNO = value,
                        obscureText: true,
                        validator: (value) {
                          if (value!.length < 11) {
                            return 'Phone Number must be more than 11 characters';
                          } else if (value.isEmpty) {
                            return 'Phone Number Field cant be empty';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.go,
                        decoration: textFormFieldDecoration()
                            .copyWith(hintText: 'Phone Number'),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      ButtonTheme(
                        buttonColor: Colors.white,
                        minWidth: MediaQuery.of(context).size.width,
                        height: 150.h,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.all(Radius.circular(70.r))),
                        child: FlatButton(
                          color: Colors.orange,
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                _isloading = true;
                              });
                              try {
                                await AuthService().signUp(email!, password!,
                                    username!, phoneNO!, context);
                                setState(() {
                                  _isloading = false;
                                });
                              } catch (e) {
                                print(e.toString());
                                setState(() {
                                  _isloading = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Text('Already have an account?'),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () => widget.toggleView(),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      )),
    );
  }
}
