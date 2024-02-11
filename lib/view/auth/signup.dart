import 'package:driver/utilitys/app_const.dart';import 'package:driver/utilitys/colors.dart';import 'package:driver/view/auth/login.dart';import 'package:driver/widgets/appButton.dart';import 'package:driver/widgets/app_inputs.dart';import 'package:driver/widgets/text_widgets.dart';import 'package:flutter/material.dart';import 'package:font_awesome_flutter/font_awesome_flutter.dart';class SingUp extends StatefulWidget {  const SingUp({Key? key}) : super(key: key);  @override  State<SingUp> createState() => _SingUpState();}class _SingUpState extends State<SingUp> {  final _signUpFormState = GlobalKey<FormState>();  final _fullName = TextEditingController();  final _email = TextEditingController();  final _pass = TextEditingController();  final _cPass = TextEditingController();  bool _showPassword = false;  bool _isLoading = false;  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: AppColors.bgColor,      body:SingleChildScrollView(        padding: EdgeInsets.only(top: 100, bottom: 20, right: 20, left: 20),        child: Column(          mainAxisAlignment: MainAxisAlignment.start,          crossAxisAlignment: CrossAxisAlignment.start,          children: [            Image.asset("${AppConst.app_logo}" , height: 120, width: 120,),            SizedBox(height: 20,),            TextWithSubText(              title: "Login",              subTitle: "Enter your email and we'll send you a login code",            ),            SizedBox(height: 20,),            Form(                key: _signUpFormState,                child: Column(                  children: [                    AppInput(                      title: "Full Name",                      hintText: "Full Name",                      controller: _fullName,                      validator: (v){                        if(v!.isEmpty){                          return "name must not be empty.";                        }else{                          return null;                        }                      },                    ),                    SizedBox(height: 20,),                    AppInput(                      title: "Email",                      hintText: "jhon@gmail.com",                      controller: _email,                      validator: (v){                        if(v!.isEmpty){                          return "Email must not be empty.";                        }else{                          return null;                        }                      },                    ),                    SizedBox(height: 20,),                    AppInput(                      title: "Password",                      hintText: "password",                      controller: _pass,                      obscureText: _showPassword,                      suffixIcon: IconButton(                        onPressed: (){                          setState(() {                            _showPassword = !_showPassword;                          });                        },                        icon: Icon(_showPassword ?Icons.visibility: Icons.visibility_off, color: AppColors.bgColor,),),                      validator: (v){                        if(v!.isEmpty){                          return "Password must not be empty.";                        }else if(v!.length > 7){                          return "Password must be 6 characters";                        }else{                          return null;                        }                      },                    ),                    SizedBox(height: 20,),                    AppInput(                      title: "Confirm Password",                      hintText: "Confirm password",                      controller: _cPass,                      obscureText: _showPassword,                      suffixIcon: IconButton(                        onPressed: (){                          setState(() {                            _showPassword = !_showPassword;                          });                        },                        icon: Icon(_showPassword ?Icons.visibility: Icons.visibility_off, color: AppColors.bgColor,),),                      validator: (v){                        if(v!.isEmpty){                          return "Confimr Password must not be empty.";                        }else if(v!.toString() != _pass.text){                          return "Confirm Password doesn't match.";                        }else{                          return null;                        }                      },                    ),                    SizedBox(height: 30,),                    AppButton(                      onClick: (){},                      text: "Sign Up",                      isLoading: _isLoading,                    ),                    SizedBox(height: 30,),                    InkWell(                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())),                        child: Center(                            child: RichText(                              text: TextSpan(                                  children: [                                    TextSpan(text: "I have an account.",                                      style: TextStyle(                                          color: AppColors.black,                                          fontWeight: FontWeight.w400,                                          fontSize: 14                                      ),                                    ),                                    TextSpan(text: " Login Now",                                      style: TextStyle(                                          color: AppColors.blue,                                          fontWeight: FontWeight.w600,                                          fontSize: 14                                      ),                                    )                                  ]                              ),                            )                        ))                  ],                ))          ],        ),      ),    );  }}