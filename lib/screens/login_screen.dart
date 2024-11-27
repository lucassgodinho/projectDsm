import '/screens/register_screen.dart';
import '/widgets/custom_input.dart';
import '/widgets/error_auth.dart';
import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/widgets/custom_input_password.dart';
import '/widgets/custom_loading.dart';

class LoginScreen extends StatelessWidget {
  final AuthService authService;

  const LoginScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
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
                controller: authService.emailController,
                textInputType: TextInputType.emailAddress,
                label: 'Email',
                hintText: 'Email',
              ),
              CustomInputPassword(
                controller: authService.passwordController,
                textInputType: TextInputType.visiblePassword,
                label: 'Password',
                hintText: 'Password',
              ),
              ErrorAuth(
                listenable: authService.isErrorGeneric,
                messageError: "Um problema ocorreu",
              ),
              ErrorAuth(
                listenable: authService.isErrorCredential,
                messageError: "Suas credenciais estão invalidas",
              ),
              CustomLoading(
                listenable: authService.isLoading,
                textButton: "Login",
                action: () {
                  authService.login(context);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RegisterScreen(authService: authService)),
                  );
                },
                child: const Text("Cadastre-se"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
