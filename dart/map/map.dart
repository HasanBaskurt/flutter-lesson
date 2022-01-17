void main() {
  Map maps = {"String": "string", 5: "number"};
  maps[3] = "sddsdf";
  maps[true] = "true";

  for (var map in maps.keys) {
    print(map);
  }
  print("***************");
  for (var map in maps.values) {
    print(map);
  }

  print("***************");
  print(maps.length);

  print("***************");
  print(maps.containsKey("sdfds"));
  print(maps.containsKey(5));

  print("***************");
  maps.remove(5);
  print(maps.keys);

  print("***************");
  maps.forEach((k, v) => print(k));
  maps.forEach((k, v) => {
        print(k.toString() + " " + v.toString()),
      });

  print("***************");
  maps.clear();
  print(maps.values);
}
