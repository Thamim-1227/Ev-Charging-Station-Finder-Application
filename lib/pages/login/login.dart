import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hyperev/app_style.dart';
import 'package:hyperev/pages/signup/signup.dart';
import 'package:hyperev/gmap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../app_style.dart';

class Login extends StatefulWidget {
  static String id = "/login";
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.035,
            ),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Welcome Back!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: size.height * 0.018),
                Text(
                  "Sign in to Contiune",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 15),
                ),
                SizedBox(height: size.height * 0.020),
                TextField(
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Username",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(userIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.016),
                TextField(
                  obscureText: true,
                  style: const TextStyle(color: kLightTextColor),
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(lockIcon),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.021),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: kTextColor),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: check,
                      activeColor: kLightTextColor,
                      onChanged: (bool? value) {
                        setState(() {
                          check = value!;
                        });
                      },
                    ),
                    Text(
                      "Remember me and keep me logged in",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.029),
                ElevatedButton(
                  onPressed: () {
                    // Redirect to GMap page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GMap()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Set the background color to blue
                  ),
                  child: Text(
                    "Sign in",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: size.height * 0.029),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not member yet?\t",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Signup.id, (route) => false);
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: kTextColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
