import 'dart:io';

void main() {
  // Langkah 1
  int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  }

  // Langkah 3
  counter = 0;
  do {
    // print(counter);
    stdout.write("$counter ");
    counter++;
  } while (counter < 77);
}
