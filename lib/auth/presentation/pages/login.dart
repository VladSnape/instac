import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instac/auth/presentation/bloc/bloc/auth_bloc.dart';
import 'package:instac/auth/presentation/widget/google_button.dart';
import 'package:instac/auth/presentation/widget/login_button.dart';
import 'package:instac/auth/presentation/widget/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final Function() toggle;
  const LoginPage({super.key, required this.toggle});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.33,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 105, 145, 240),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Khtai instagram",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Welcome sir , the desert awaits you",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 87, 87),
                                fontSize: 18,
                                fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  obscure: false,
                  hint: "email@gmail.com",
                  text: 'your email',
                  controller: emailController),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  obscure: true,
                  hint: 'password',
                  text: 'your Password',
                  controller: passwordController),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  },
                  child: const LoginButton(
                    text: 'Login',
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Or",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {},
                  child: const GoogleButton(
                    text: 'Login with Google',
                  )),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "you dont have an account ?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 184, 184, 184),
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: widget.toggle,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color.fromARGB(255, 105, 145, 240),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
