void main() {
  for (int i = 0, count = 0; i <= 201; i++) {
    if (isPrime(i)) {
      count++;
      print(
        'Bilangan prima ke-$count adalah $i, Hidayat Widi Saputra, NIM 2341720157',
      );
    }
  }
}

bool isPrime(int n) {
  if (n < 2) return false;
  if (n % 2 == 0) return n == 2;
  for (int i = 3; i * i <= n; i += 2) {
    if (n % i == 0) return false;
  }
  return true;
}
