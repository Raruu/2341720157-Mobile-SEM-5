void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 2};

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Hidayat Widi Saputra';
  mhs1['nim'] = '2341720157';

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  gifts['nama'] = 'Hidayat Widi Saputra';
  gifts['nim'] = '2341720157';

  var mhs2 = Map<int, String>();
  mhs2[0] = 'Hidayat Widi Saputra';
  mhs2[1] = '2341720157';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';
  nobleGases[0] = 'Hidayat Widi Saputra';
  nobleGases[1] = '2341720157';

  print('\n=== HASIL ===');
  print('gifts: $gifts');
  print('nobleGases: $nobleGases');
  print('mhs1: $mhs1');
  print('mhs2: $mhs2');
}
