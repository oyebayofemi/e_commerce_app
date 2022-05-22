import 'package:e_commerce_app/services/authService.dart';
import 'package:e_commerce_app/shared/validate_email.dart';
import 'package:e_commerce_app/shared/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;

  const LoginPage({required this.toggleView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String? email, password;
  bool _isloading = false;
  bool obsureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _isloading == true
                ? load()
                : Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        'Login',
                        style: authText(),
                      ),
                      SizedBox(
                        height: 60.h,
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
                                await AuthService()
                                    .signin(email!, password!, context);
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
                            'Login',
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
                      ),
                      // Text('Login'),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
