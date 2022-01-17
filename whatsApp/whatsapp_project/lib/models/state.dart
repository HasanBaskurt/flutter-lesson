class StateModel {
  late String _name;
  late String _message;
  late String _avatarUrl;

  StateModel(this._name, this._message, this._avatarUrl);

  String get name => _name;
  set name(String name) => _name;

  String get message => _message;
  set message(String message) => _message;

  String get avatarUrl => _avatarUrl;
  set avatarUrl(String avatarUrl) => _avatarUrl;

  static List<StateModel> fakeData = [
    StateModel("Durumum", "Durum güncellemesi eklemek için dokunun",
        "https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg"),
  ];
}
