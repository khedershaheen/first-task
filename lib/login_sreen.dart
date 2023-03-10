import 'package:firsttask/flutter_list.dart';
import 'package:firsttask/register_screen.dart';
import 'package:firsttask/text_form_fild.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String routName = 'Login screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isPassword = true;
  @override
  Widget build(BuildContext context) {
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
                      'LogIn',
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
                height: 60,
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
                  if (value!.isEmpty) {
                    return "Please Enter Your Password";
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
                obscure: true,
                keybordtype: TextInputType.visiblePassword,
                hintText: 'Enter Your Password',
                lableText: 'Password',
                icon: const Icon(Icons.lock),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.pushNamed(context, FlutterList.routName);
                  }
                },
                style: TextButton.styleFrom(
                  fixedSize: const Size(350, 65),
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Idont have account ?',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 85, 83, 83)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routName);
                    },
                    child: const Text(
                      'Register',
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
