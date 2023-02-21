import 'package:firsttask/text_form_fild.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              keybordtype: TextInputType.name,
              hintText: 'Enter Your name',
              lableText: 'Full Name',
              icon: const Icon(Icons.person),
            ),
            CustomTextFormFild(
              keybordtype: TextInputType.emailAddress,
              hintText: 'example@gmail.com',
              lableText: 'Email',
              icon: const Icon(Icons.email),
            ),
            CustomTextFormFild(
              keybordtype: TextInputType.number,
              hintText: 'Enter Your Phone Number',
              lableText: 'Phone',
              icon: const Icon(Icons.phone),
            ),
            CustomTextFormFild(
              keybordtype: TextInputType.visiblePassword,
              hintText: 'Enter Your Password',
              lableText: 'Password',
              icon: const Icon(Icons.lock),
            ),
            CustomTextFormFild(
              keybordtype: TextInputType.visiblePassword,
              hintText: 'Confirm Your Password',
              lableText: 'Confirm Password',
              icon: const Icon(Icons.lock),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
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
                  onPressed: () {},
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
