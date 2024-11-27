// // Algumas dependecias que sao necessario para pode usar o firebase
// dependencies:
// firebase_core: latest_version
// firebase_auth: latest_version
//
// // codigo exemplo para implementar o firebase no codigo usando flutter
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//     );
//   }
// }
//
// class LoginScreen extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   void login() async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       print("Login realizado com sucesso!");
//     } catch (e) {
//       print("Erro ao fazer login: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
//             TextField(controller: passwordController, decoration: InputDecoration(labelText: "Senha"), obscureText: true),
//             ElevatedButton(onPressed: login, child: Text("Entrar")),
//           ],
//         ),
//       ),
//     );
//   }
// }
