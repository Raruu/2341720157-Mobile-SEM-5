void main() {
  for (int index = 10; index < 27; index++) {
    // Langkah 1
    // print(index);

    // Langkah 3
    if (index == 21)
      break;
    else if (index > 1 || index < 7)
      continue;
    print(index);
  }
}
