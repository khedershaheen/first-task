import 'package:firsttask/login_sreen.dart';
import 'package:firsttask/text_form_fild.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  static String routName = 'Register screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final conPasswordController = TextEditingController();

  final phoneController = TextEditingController();

  final nameController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    var confirmPass;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.purple,
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFild(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    //allow upper and lower case alphabets and space
                    return "Enter Correct Name";
                  } else {
                    return null;
                  }
                },
                controller: nameController,
                obscure: false,
                keybordtype: TextInputType.name,
                hintText: 'Enter Your name',
                lableText: 'Full Name',
                icon: const Icon(Icons.person),
              ),
              CustomTextFormFild(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return "Enter Correct Email Address";
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                obscure: false,
                keybordtype: TextInputType.emailAddress,
                hintText: 'example@gmail.com',
                lableText: 'Email',
                icon: const Icon(Icons.email),
              ),
              CustomTextFormFild(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                          .hasMatch(value)) {
                    //  r'^[0-9]{10}$' pattern plain match number with length 10
                    return "Enter Correct Phone Number";
                  } else {
                    return null;
                  }
                },
                controller: phoneController,
                obscure: false,
                keybordtype: TextInputType.number,
                hintText: 'Enter Your Phone Number',
                lableText: 'Phone',
                icon: const Icon(Icons.phone),
              ),
              CustomTextFormFild(
                validator: (value) {
                  confirmPass = value;
                  if (value!.isEmpty) {
                    return "Please Enter New Password";
                  } else if (value.length < 8) {
                    return "Password must be atleast 8 characters long";
                  } else {
                    return null;
                  }
                },
                suffIcon: IconButton(
                  icon: _isPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPassword = !_isPassword;
                    });
                  },
                ),
                controller: passwordController,
                obscure: _isPassword,
                keybordtype: TextInputType.visiblePassword,
                hintText: 'Enter Your Password',
                lableText: 'Password',
                icon: const Icon(Icons.lock),
              ),
              CustomTextFormFild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Re-Enter New Password";
                  } else if (value.length < 8) {
                    return "Password must be atleast 8 characters long";
                  } else if (value != confirmPass) {
                    return "Password must be same as above";
                  } else {
                    return null;
                  }
                },
                suffIcon: IconButton(
                  icon: _isPassword
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPassword = !_isPassword;
                    });
                  },
                ),
                controller: conPasswordController,
                obscure: _isPassword,
                keybordtype: TextInputType.visiblePassword,
                hintText: 'Confirm Your Password',
                lableText: 'Confirm Password',
                icon: const Icon(Icons.lock),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  _formkey.currentState!.validate();
                },
                style: TextButton.styleFrom(
                  fixedSize: const Size(350, 65),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have account ?',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 85, 83, 83)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routName);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void togglePassword() {}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 25;
    final highPoint = size.height - 40;
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 10);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
