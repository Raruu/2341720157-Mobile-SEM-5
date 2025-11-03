# Praktikum 1: Mengunduh Data dari Web Service (API)

## Langkah 1: Buat Project Baru

Buatlah sebuah project flutter baru dengan nama books di folder src week-11 repository GitHub Anda.

Kemudian Tambahkan dependensi http dengan mengetik perintah berikut di terminal.

```shell
flutter pub add http
```

![alt](./img/p1s1.png)

## Langkah 2: Cek file pubspec.yaml

![alt](./img/p1s2.png)

## Langkah 3: Buka file main.dart

Ketiklah kode seperti berikut ini.

### Soal 1

Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Praktikum Widi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back from the Future - Widi')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: Text('Go!')),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

## Langkah 4: Tambah method getData()

Tambahkan method ini ke dalam class \_FuturePageState yang berguna untuk mengambil data dari API Google Books.

### Soal 2

- Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
- Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W11: Soal 2".

- Link: https://www.google.co.id/books/edition/Mushoku_Tensei_Jobless_Reincarnation_A_J/xdQgEQAAQBAJ?hl=en&gbpv=0
- Kode unik: `xdQgEQAAQBAJ`
- Di dalam method getData() pada main.dart, ganti ID buku yang ada `xdQgEQAAQBAJ` dengan ID buku yang baru.

  ```dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/xdQgEQAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
  ```

- Hasil google apis https://www.googleapis.com/books/v1/volumes/xdQgEQAAQBAJ:

![alt](./img/p1soal2.png)

## Langkah 5: Tambah kode di ElevatedButton

Tambahkan kode pada onPressed di ElevatedButton seperti berikut.

```dart
ElevatedButton(
  onPressed: () {
    setState(() {});
    getData()
        .then((value) {
          result = value.body.toString().substring(0, 450);
          setState(() {});
        })
        .catchError((_) {
          result = 'An error occurred';
          setState(() {});
        });
  },
  child: Text('Go!'),
),
```

### Soal 3

- Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
  - substring(0, 450)\
     Memotong string hasil value.body agar hanya 450 karakter pertama yang disimpan di variabel result.
    Tujuannya agar widget Text tidak menampilkan seluruh respons (yang bisa sangat panjang) melainkan cuplikan singkat saja.
  - catchError((\_) { … })\
     Menangkap setiap kegagalan yang terjadi selama pemanggilan getData() maupun saat menjalankan then, termasuk bila substring(0, 450) gagal (mis. karena body-nya kosong atau kurang dari 450 karakter).
    Ketika ada error, result diisi string 'An error occurred' dan setState dipanggil untuk memperbarui tampilan.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".
  - Hasil:\
    ![hasil](./img/p1result.webp)

# Praktikum 2: Menggunakan await/async untuk menghindari callbacks

## Langkah 1: Buka file main.dart

Tambahkan tiga method berisi kode seperti berikut di dalam class \_FuturePageState.

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

## Langkah 2: Tambah method count()

Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.

```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

## Langkah 3: Panggil count()

Lakukan comment kode sebelumnya, ubah isi kode onPressed() menjadi seperti berikut.

![alt](./img/p2s3.png)

## Langkah 4: Run

Akhirnya, run atau tekan F5 jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.

### Soal 4

- Jelaskan maksud kode langkah 1 dan 2 tersebut!
  - Langkah 1 – membuat tiga method async\
     Tujuannya hanya men-supply pekerjaan “pura-pura lama” (3 detik) yang nanti akan dijalankan secara berurutan.
    - Masing-masing method mengembalikan Future<int> dengan nilai 1, 2, dan 3.
    - await Future.delayed(...) membuat prosesnya benar-benar menunggu 3 detik sebelum mengembalikan angka tersebut, sehingga kita punya “task” yang bisa dipantau waktunya.
  - Langkah 2 – method count()\
    Method ini menunjukkan pola urutan (sequential) pada operasi async: - Mulai dengan total = 0. - Menunggu returnOneAsync() selesai (3 detik), ambil hasil 1 → total = 1. - Menunggu returnTwoAsync() selesai (3 detik lagi), tambahkan 2 → total = 3. - Menunggu returnThreeAsync() selesai (3 detik lagi), tambahkan 3 → total = 6. - Setelah ketiga tugas selesai (total ~9 detik), baru memanggil setState untuk memperbarui UI dengan angka 6.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4".
  - Hasil:\
    ![alt](./img/p2result.webp)

# Praktikum 3: Menggunakan Completer di Future

## Langkah 1: Buka main.dart

Pastikan telah impor package async berikut.

```dart
import 'package:async/async.dart';
```

## Langkah 2: Tambahkan variabel dan method

Tambahkan variabel late dan method di class \_FuturePageState seperti ini.

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds: 5));
  completer.complete(42);
}
```

## Langkah 3: Ganti isi kode onPressed()

Tambahkan kode berikut pada fungsi onPressed(). Kode sebelumnya bisa Anda comment.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
});
```

## Langkah 4:

Terakhir, run atau tekan F5 untuk melihat hasilnya jika memang belum running. Bisa juga lakukan hot restart jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.

## Langkah 5: Ganti method calculate()

Gantilah isi code method calculate() seperti kode berikut, atau Anda dapat membuat calculate2()

```dart
Future calculate() async {
  try {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  } catch (e) {
    completer.completeError(e);
  }
}
```

### Soal 5

- Jelaskan maksud kode langkah 2 tersebut!
  - late Completer completer;\
    Menyediakan wadah (Completer) yang nanti akan men-complete sebuah Future<int> secara manual.
  - getNumber()\
    Membuat instance Completer<int> baru.
    Langsung memanggil calculate() (tanpa await), jadi tidak menunggu 5 detik.
    Langsung mengembalikan completer.future ke pemanggil. Pemanggil langsung mendapat Future yang belum selesai; nilai akan datang nanti.
  - calculate()\
    Menunggu 5 detik.
    Setelah 5 detik, memanggil completer.complete(42). Saat itulah Future yang dikembalikan getNumber() selesai dengan nilai 42.
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".
  Hasil:\
   ![alt](./img/p3s4.webp)

## Langkah 6: Pindah ke onPressed()

Ganti menjadi kode seperti berikut.

```dart
getNumber()
.then((value) {
  setState(() {
    result = value.toString();
  });
})
.catchError((e) {
  result = 'An error occurred';
});
```

### Soal 6

- Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!
  - Perbedaanya pada kode langkah 5-6 dapat menghandle jika terjadi error
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 6".
  Hasil:\
   ![alt](./img/p3s4.webp)

# Praktikum 4: Memanggil Future secara paralel

Library:

```shell
flutter pub add async
```

## Langkah 1: Buka file main.dart

Tambahkan method ini ke dalam class \_FuturePageState

```dart
Future returnFG() async {
  FutureGroup<int> futureGroup = FutureGroup<int>();
  futureGroup.add(returnOneAsync());
  futureGroup.add(returnTwoAsync());
  futureGroup.add(returnThreeAsync());
  futureGroup.close();
  final futures = await futureGroup.future;
  int total = 0;
  for (var num in futures) {
    total += num;
  }
  setState(() {
    result = total.toString();
  });
}
```

## Langkah 2: Edit onPressed()

Anda bisa hapus atau comment kode sebelumnya, kemudian panggil method dari langkah 1 tersebut.

```dart
ElevatedButton(
            onPressed: () {
              returnFG();
              // getNumber()
```

## Langkah 3: Run

Anda akan melihat hasilnya dalam 3 detik berupa angka 6 lebih cepat dibandingkan praktikum sebelumnya menunggu sampai 9 detik.

### Soal 7

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".

![alt](./img/p4s3.webp)

## Langkah 4: Ganti variabel futureGroup

Anda dapat menggunakan FutureGroup dengan Future.wait seperti kode berikut.

```dart
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);
```

### Soal 8

Jelaskan maksud perbedaan kode langkah 1 dan 4!

- Future.wait([...])

  - Sudah built-in ke Dart.
  - Langsung mengembalikan List<T> berisi hasil semua Future begitu semuanya selesai.
  - Lebih ringkas & idiomatic:

  ```dart
  final futures = await Future.wait([...]);
  int total = futures.reduce((a,b)=>a+b);
  ```

- FutureGroup (dari pak async)
  - Harus buat objek FutureGroup, .add() satu per satu, lalu .close() untuk menandai “tidak ada lagi Future yang akan ditambahkan”.
  - Setelah itu await futureGroup.future baru menghasilkan List<T>.
  - Penulisannya lebih panjang, tapi dulu (sebelum Future.wait populer) dipakai kalau butuh API yang bisa “nambah-nambah Future dinamis” lalu menutupnya.

# Praktikum 5: Menangani Respon Error pada Async Code

## Langkah 1: Buka file main.dart

Tambahkan method ini ke dalam class \_FuturePageState

```dart
Future<int> returnError() async {
  await Future.delayed(const Duration(seconds: 2));
  throw Exception('Something terrible happened!');
}
```

## Langkah 2: ElevatedButton

Ganti dengan kode berikut

```dart
returnError()
    .then((value) {
      setState(() {
        result = 'Success';
      });
    })
    .catchError((onError) {
      setState(() {
        result = onError.toString();
      });
    })
    .whenComplete(() => print('Complete'));
```

## Langkah 3: Run

Lakukan run dan klik tombol GO! maka akan menghasilkan seperti gambar berikut.

### Soal 9

Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 9".

![alt](./img/p5s3.webp)

![alt](./img/p5s3.png)

## Langkah 4: Tambah method handleError()

Tambahkan kode ini di dalam class _FutureStatePage

### Soal 10
Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

![alt](./img/p5s3.webp)

![alt](./img/p5s3.png)
