import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email field
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: controller.isEmailValid.value
                      ? null
                      : 'Invalid email format',
                ),
                onChanged: (value) {
                  // Validate email format
                  controller.isEmailValid.value = GetUtils.isEmail(value);
                },
              ),
              SizedBox(height: 16),

              // Password field
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: controller.isPasswordValid.value
                      ? null
                      : 'Password must be at least 6 characters',
                ),
                onChanged: (value) {
                  // Validate password length
                  controller.isPasswordValid.value =
                  value.length >= 6 ? true : false;
                },
              ),
              SizedBox(height: 32),

              // Login button
              ElevatedButton(
                onPressed: () {
                  print(controller.emailController.text.toString());
                  controller.login(controller.emailController.text,
                      controller.passwordController.text);
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
