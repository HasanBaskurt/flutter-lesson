import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:sample_api_project/apis/movie_api.dart';
import 'package:sample_api_project/models/movie_character.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sample_api_project/widgets/cards.dart';
//import 'package:image_fade/image_fade.dart';

class CharacterTraits extends StatefulWidget {
  late final int _id;
  CharacterTraits(int id, {Key? key}) : super(key: key) {
    _id = id;
  }
  @override
  State<StatefulWidget> createState() => CharacterTraitsState();
}

class CharacterTraitsState extends State<CharacterTraits> {
  MovieCharacter? character;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading == false
        ? SafeArea(
            child: Scaffold(
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
                child: const Center(
                    child: SpinKitSpinningLines(
                  color: Colors.yellow,
                  size: 150,
                )),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff191919),
                shadowColor: Colors.redAccent,
                title: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    ColorizeAnimatedText(
                      // ignore: unnecessary_string_interpolations
                      '${character!.name}',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      // ignore: unnecessary_string_interpolations
                      '${character!.nickname}',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    // ignore: avoid_print
                    print("Tap Event");
                  },
                ),
                /*leading: CircleAvatar(
                  backgroundImage: NetworkImage(character.image.toString()),
                ),*/
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                        image: NetworkImage(character!.image.toString()),
                        height: 300,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        //fadeDuration:Duration(seconds:2)
                        //fadeCurve:Curves.bounceInOut
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 20,
                      child: Divider(
                        // ignore: deprecated_member_use
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    createCard('Name :', character!.name.toString(), context),
                    createCard(
                        'Nickname :', character!.nickname.toString(), context),
                    createCard(
                        'Birthday :', character!.birthday.toString(), context),
                    createCard(
                        'Status :', character!.status.toString(), context),
                  ],
                ),
              ),
            ),
          );
  }

  void getCharacter() async {
    await MovieApi.getCharacterApi(widget._id).then((value) {
      setState(() {
        character = value;
        loading = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharacter();
  }
}

const colorizeColors = [
  Colors.yellow,
  Colors.red,
  Colors.orange,
];

const colorizeTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Horizon',
);
