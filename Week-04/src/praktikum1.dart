void main() {
  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);
  //
  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  final List list = List<String?>.filled(5, null);
  list[1] = 'Hidayat Widi Saputra';
  list[2] = '2341720157';

  print('Length list: ${list.length}');
  print('Element index 1: ${list[1]}');
  print('Element index 2: ${list[2]}');
  print('List: $list');
}
