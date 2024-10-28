import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/register/login.dart';
import 'package:online_course_app/util/route_names.dart';

import '../../services/sign_up_login.dart'; // Make sure to import your AuthService

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService(); // Instance of AuthService
  final CollectionReference _todoRef =
      FirebaseFirestore.instance.collection("users");

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight =  MediaQuery.of(context).size.height;
    double de_Height = deviceWidth < 380 ? 5 : 100;
    double dev_Height = deviceWidth < 380 ? 40 : 100;
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: de_Height ),
              const Center(
                  child: Text("Sign Up",
                      style: TextStyle(
                          fontFamily: 'Rubik Medium',
                          fontSize: 24,
                          color: Color(0xff2D3142)))),
              const SizedBox(height: 50),
              const Center(
                  child: Text(
                      "Transform curiosity into capability \n  start your learning journey now.",
                      style: TextStyle(
                          fontFamily: 'Rubik Regular',
                          fontSize: 18,
                          color: Color(0xff4C5988)))),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: TextFormField(
                  controller: _nameController,
                  decoration:const  InputDecoration(
                      hintText: 'Name',
                      fillColor: Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon:
                          Icon(Icons.person, color: Color(0xff233F4B))),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Please enter your name"
                      : null,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                child: TextFormField(
                  controller: _contactController,
                  decoration: const InputDecoration(
                      hintText: 'Contact',
                      fillColor: Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon:
                          Icon(Icons.call, color: Color(0xff233F4B))),
                  validator: (value) => (value == null || value.isEmpty)
                      ? "Enter your Contact"
                      : null,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'Email',
                      fillColor: Color(0xffF8F9FA),
                      filled: true,
                      prefixIcon:
                          Icon(Icons.email, color: Color(0xff233F4B))),
                  validator: (value) {
                    String emailPattern =
                        r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$';
                    RegExp emailRegex = RegExp(emailPattern);
                    return (value == null || value.isEmpty)
                        ? "Please enter your email"
                        : (!emailRegex.hasMatch(value))
                            ? "Please enter a valid email"
                            : null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: const Color(0xffF8F9FA),
                    filled: true,
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xff233F4B)),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    String passwordPattern =
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$';
                    RegExp passwordRegex = RegExp(passwordPattern);
                    return (value == null || value.isEmpty)
                        ? "Please enter password first"
                        : (!passwordRegex.hasMatch(value))
                            ? "Password must be at least 8 characters, include a number, an uppercase letter, a lowercase letter, and a special symbol"
                            : null;
                  },
                ),
              ),
              SizedBox(height: dev_Height),
              Container(
                height: 50,
                width: 340,
                decoration: BoxDecoration(
                    color: const Color(0xffF9703B),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: InkWell(
                    // Inside the onTap of the Sign Up button
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        User? user = await _authService.signUp(
                          _emailController.text,
                          _passwordController.text,
                        );
                        // Log the user object for debugging

                        if (user != null) {
                          // Ensure that the navigation is correct and LoginPage is defined in your routes
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Sign Up Failed. Please try again.")));
                        }
                      }
                    },

                    child: const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Rubik Regular',
                            color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                            fontFamily: 'Rubik Regular',
                            fontSize: 15,
                            color: Color(0xff233F4B))),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.loginPage);
                      },
                      child: const Text("Login",
                          style: TextStyle(
                              fontFamily: 'Rubik Regular',
                              fontSize: 15,
                              color: Color(0xffF9703B))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
