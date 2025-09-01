void lateExample() {
  late String nama;
  // print(nama); Error: Late variable 'nama' without initializer is definitely unassigned.
  nama = 'Widi';
  print(nama); // Output: Widi
}

void nullAbleExample() {
  String? nama; // Nilai awal null
  nama = null; // Bisa diberi nilai null
  print(nama); // Output: null
  print(nama ?? 'Nama belum diisi'); // Output: Nama belum diisi
  // Contoh penggunaan null-aware operator, tanpa hal tersebut maka akan Error: Property 'length' cannot be accessed on 'String?' because it is potentially null.
  print(nama?.length ?? 0); // Output: 0
  nama = 'Widi';
  print(nama); // Output: Widi
}

void main() {
  lateExample();
  nullAbleExample();
}
