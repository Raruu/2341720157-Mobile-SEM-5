void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  var list1 = [1, 2, null];
  print('\nlist1: $list1');
  var nim = [2, 3, 4, 1, 7, 2, 0, 1, 5, 7];
  print('nim: $nim');
  var list3 = [0, ...?list1, ...nim];
  print('list3: $list3');
  print('length list3: ${list3.length}');

  print('');
  List<String> langkah4(bool promoActive) {
    return ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  }

  print('Langkah 4:');
  print('Jika true: ${langkah4(true)}');
  print('Jika false: ${langkah4(false)}');

  print('\nLangkah 5:');
  List<String> langkah5(String login) {
    return [
      'Home',
      'Furniture',
      'Plants',
      if (login case 'Manager') 'Inventory',
      if (login case 'Admin') 'Outlet',
      if (login case 'Customer') 'Cart',
    ];
  }

  print('login == Manager: ${langkah5('Manager')}');
  print('login == Admin: ${langkah5('Admin')}');
  print('login == Customer: ${langkah5('Customer')}');

  print('\nLangkah 6:');
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
