isTextValid(String input) => input.length > 1;

isNumberValid(String input) {
  if (input.isEmpty) {
    return false;
  }
  final number = int.tryParse(input);
  if (number == null) {
    return false;
  }
  return true;
}
