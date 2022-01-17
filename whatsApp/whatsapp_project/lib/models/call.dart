class Call {
  late String _name;
  late String _time;
  late String _avatarUrl;

  Call(this._name, this._time, this._avatarUrl);

  String get name => _name;
  set name(String name) => _name;

  String get time => _time;
  set time(String time) => _time;

  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl;

  static List<Call> fakeData = [
    Call("Hasan", "15 Kasım 14:20",
        "https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg"),
    Call("Sadoo", "15 Kasım 10:54",
        "https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg"),
  ];
}
