// ignore: camel_case_types
class MovieCharacter {
  late int _charId;
  late String _name;
  late String _birthday;
  late String _image;
  late String _status;
  late String _nickname;

  MovieCharacter(this._charId, this._name, this._birthday, this._image,
      this._status, this._nickname);

  MovieCharacter.fromMap(dynamic o) {
    _charId = o["char_id"];
    _name = o["name"];
    _birthday = o["birthday"];
    _image = o["img"];
    _status = o["status"];
    _nickname = o["nickname"];
  }

  int get charId => _charId;
  set charId(int charId) => _charId;

  String get name => _name;
  set name(String name) => _name;

  String get birthday => _birthday;
  set birthday(String birthday) => _birthday;

  String get image => _image;
  set image(String image) => _image;

  String get status => _status;
  set status(String status) => _status;

  String get nickname => _nickname;
  set nickname(String nickname) => _nickname;
}
