import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/auth/presentation/screens/registration_screen.dart';
import 'package:rick_and_morty/generated/l10n.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: loginController.text,
      password: passwordController.text,
    );
  }

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/main.png',
                    height: 377,
                    width: 268,
                  ),
                ),
                Text(S.of(context).login),
                SizedBox(height: 10),
                TextField(
                  controller: loginController,
                  decoration: InputDecoration(
                    hintText: '${S.of(context).login}',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(S.of(context).password),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: '${S.of(context).password}',
                    suffixIcon: Icon(Icons.visibility_off_rounded),
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()));
                  },
                  child: Text(S.of(context).login),
                  style: ElevatedButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Color(0xff22A2BD),
                    foregroundColor: Colors.white,
                    minimumSize: Size(MediaQuery.of(context).size.width, 48),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(
                      text: 'У вас еще нет аккаунта?  ',
                      style: TextStyle(
                        color: Color(0xff5B6975),
                      ),
                      children: [
                        TextSpan(
                          text: '${S.of(context).create}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff43D049),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()));
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
