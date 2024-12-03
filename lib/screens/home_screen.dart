import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import '/services/api_service.dart';
import '/models/character.dart';


class HomeScreen extends StatefulWidget {
  final ApiService apiService;
  final AuthService authService;

  const HomeScreen({Key? key, required this.apiService,required this.authService}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiService service;
  late final AuthService authservices;

  @override
  void initState() {
    super.initState();
    service = widget.apiService;
    authservices = widget.authService;

    characters = service.getCharacters();
  }

  late Future<List<Character>> characters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              authservices.logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
        body: FutureBuilder<List<Character>>(
          future: characters,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || snapshot.data!.isEmpty ?? true) {
              return Center(child: Text(snapshot.hasError ? 'Erro: ${snapshot.error}' : 'Nenhum personagem encontrado'));
            }


            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  leading: Image.network(snapshot.data![index].image,),

                );
              },
            );
          },
        )

    );
  }
}
