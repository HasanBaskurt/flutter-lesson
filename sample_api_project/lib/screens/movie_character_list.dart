import 'package:flutter/material.dart';
import 'package:sample_api_project/apis/movie_api.dart';
import '../models/movie_character.dart';
import 'character_traits.dart';

class MovieCharacters extends StatefulWidget {
  const MovieCharacters({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MovieCharactersState();
}

class MovieCharactersState extends State<MovieCharacters> {
  List<MovieCharacter> characterList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff191919),
            shadowColor: Colors.redAccent,
            title: const Text(
              "Breaking Bad",
              style: TextStyle(color: Colors.orange, fontSize: 25),
            ),
            centerTitle: true,
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff64B5f6),
                    Colors.black,
                  ],
                  tileMode: TileMode.mirror),
            ),
            child: ListView.builder(
                itemCount: characterList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CharacterTraits(
                                  characterList[index].charId.toInt())));
                    },
                    child: ListTile(
                      title: Text(
                        characterList[index].name.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              characterList[index].image.toString())),
                    ),
                  );
                }),
          )),
    );
  }

  void getCharacters() async {
    await MovieApi.getMovieCharactersApi().then((value) {
      setState(() {
        characterList = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
  }
}
