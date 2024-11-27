import 'package:flutter/material.dart';
import 'package:desenvolvimento_de_sistema_moveis/services/api_service.dart';
import '../models/character.dart';


class HomeScreen extends StatefulWidget {
  final ApiService apiService;

  const HomeScreen({Key? key, required this.apiService}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ApiService service;

  @override
  void initState() {
    super.initState();
    service = widget.apiService;

    characters = service.getCharacters();
  }

  late Future<List<Character>> characters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder<List<Character>>(
        future: characters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum personagem encontrado'));
          } else {
            List<Character> characterList = snapshot.data!;
            return ListView.builder(
              itemCount: characterList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(characterList[index].name),
                  leading: Image.network(characterList[index].image),
                );
              },
            );
          }
        },
      ),
    );
  }
}
