void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = <String>{}; // Creates a map, not a set.

  // .add()
  names2.add('Hidayat Widi Saputra');
  names2.add('2341720157');

  // .addAll()
  names3.addAll(['Hidayat Widi Saputra', '2341720157']);

  print("names1 : $names1");
  print("names2 .add(): $names2");
  print("names3 .addAll(): $names3");
}
