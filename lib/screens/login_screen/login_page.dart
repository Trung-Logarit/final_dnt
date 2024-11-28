import 'package:flutter/material.dart';
import 'my_textfield.dart';
import 'login_button.dart';
import 'square_title.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final usernameController= TextEditingController();
  final passwordController= TextEditingController();

  // sign user in methon
  void signUserIn(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 30,),
              // logo
              // Icon(
              //   Icons.lock,
              //   size: 100,
              // ),
              Image(
                image: AssetImage('assets/fpt.png'),
                height: 100,
              ),

              SizedBox(height: 20,),
              Text(
                'Welcome to Workplace of FPT Software',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              // const SizedBox(height: 15,),
              // // welcomeback
              // Text(
              //   'Welcome back you\' ve been missed!',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 16,
              //   ),
              // ),
              const SizedBox(height: 25,),
              //username text field
              MyTextfield(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10,),

              // password textfield
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10,),
              // forgot password
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              // Login button
              LoginButton(
                onTap: signUserIn,
              ),
              const SizedBox(height: 30,),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                    Expanded(child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              // google + facebook sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTitle(imagePath: 'assets/gg.png'),
                  const SizedBox(width: 25,),
                  // facebook button
                  SquareTitle(imagePath: 'assets/fb.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}