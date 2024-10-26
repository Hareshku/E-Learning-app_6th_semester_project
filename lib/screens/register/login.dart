import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/services/sign_up_login.dart';
import '../../util/route_names.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey= GlobalKey<FormState>();
  final email=TextEditingController();
  final password=TextEditingController();
  AuthService service = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Grow Your skills",
          style: TextStyle(
              fontSize: 24,
              color: Color(0xff2D3142),
              fontFamily: 'Rubik Medium'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  "LogIn",
                  style: TextStyle(
                    fontFamily: 'Rubik Medium',
                    fontSize: 24,
                    color: Color(0xff2D3142),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Center(
                child: Text(
                  "Every skill you gain opens new doors. \n            Begin your journey here.",
                  style: TextStyle(
                    fontFamily: 'Rubik Regular',
                    fontSize: 18,
                    color: Color(0xff4C5988),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28,),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'email',
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.email, color: Color(0xff233F4B),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffE4E7EB),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(
                        color: Color(0xffE4E7EB),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if(value==null&& value!.isEmpty){
                      return "Please enter your email";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(

                    hintText: 'password',
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock, color: Color(0xff233F4B),),

                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xffE4E7EB),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:const BorderSide(
                        color: Color(0xffE4E7EB),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon:const Icon(Icons.visibility_off),
                      onPressed: (){},
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Please enter your password";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              // const SizedBox(height: 10,),
              // const Padding(
              //   padding: EdgeInsets.only(
              //     right: 28,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text('Forgot Password?', style: TextStyle(decoration: TextDecoration.underline),),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 80,),
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                  color: const Color(0xffF9703B),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Center(
                  child: InkWell(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        User? user = await service.signIn(
                          email.text,
                          password.text,
                        );

                        if (user != null) {
                          Navigator.pushNamed(context, RouteNames.courseHome);
                        } else {
                          // Show an error message if login fails
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Incorrect email or password'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }

                    },

                    child: const Text(
                      "LogIn",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Rubik Regular',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'Rubik Regular',
                      fontSize: 16,
                      color: Color(0xff4C5988),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap:(){
                      Navigator.pushNamed(context, RouteNames.signUpPage);
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'Rubik Medium',
                        fontSize: 16,
                        color: Color(0xffF9703B),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
