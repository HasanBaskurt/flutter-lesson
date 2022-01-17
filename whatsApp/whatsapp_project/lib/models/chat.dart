class Chat {
  late String _name;
  late String _message;
  late String _time;
  late String _avatarUrl;

  Chat(this._name, this._message, this._time, this._avatarUrl);

  String get name => _name;
  set name(String name) => _name;

  String get message => _message;
  set message(String mesage) => _message;

  String get time => _time;
  set time(String time) => _time;

  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl;

  static List<Chat> fakeData = [
    Chat("Hasan", "Hi bro, how are you?", "14:20",
        "https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg"),
    Chat("Sadoo", "Hi bro, how are you?", "10:54",
        "https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg"),
  ];
}
