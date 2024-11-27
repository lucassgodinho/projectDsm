import 'package:flutter/material.dart';

import '/services/auth_service.dart';
import '/widgets/custom_input.dart';
import '/widgets/custom_input_password.dart';
import '/widgets/custom_loading.dart';
import '/widgets/error_auth.dart';

class RegisterScreen extends StatelessWidget {
  final AuthService authService;

  const RegisterScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Expanded(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.10,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomInput(
                controller: authService.emailControllerRegister,
                textInputType: TextInputType.emailAddress,
                label: 'Email',
                hintText: 'Email',
              ),
              CustomInputPassword(
                controller: authService.passwordControllerRegister,
                textInputType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: 'Password',
              ),
              ErrorAuth(
                listenable: authService.isErrorGeneric,
                messageError: "Um problema ocorreu",
              ),
              CustomLoading(
                listenable: authService.isLoading,
                textButton: "Cadastre-se",
                action: () {
                  authService.register(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
