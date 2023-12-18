import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_page/components/my_button.dart';
import 'package:signin_page/components/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  //user signin Button

  void userSignUp() async {
    // show loading circle

    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usernameController.text,
        password: passController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      // show error to usename
      showErrorMessage(e.code);
    }
  }

  //popup for error
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //

                  Image.asset(
                    'lib/images/logo.png',
                    height: 150,
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  //text to welcome
                  Text(
                    'Welcome back you been missed!',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //textfield + username

                  MyTextField(
                    controller: usernameController,
                    hintText: 'username',
                    obscureText: false,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //textfield + password
                  MyTextField(
                    controller: passController,
                    hintText: 'password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //re-entry password
                  MyTextField(
                    controller: confirmController,
                    hintText: 'confirm password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  //forget text
                  Padding(
                    padding: const EdgeInsets.only(left: 240),
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  //sign in button
                  MyButton(
                    onTap: () {
                      userSignUp();
                    },
                    text: 'Sign Up',
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already  have an account',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          'Login now',
                          style: GoogleFonts.outfit(
                            fontSize: 14,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
