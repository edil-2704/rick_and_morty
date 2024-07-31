import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
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
              Text('Login'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Login',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Password'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off_rounded),
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: Text('Enter'),
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
            ],
          ),
        ),
      ),
    );
  }
}
