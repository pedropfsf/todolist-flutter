String limitCharacters({
  int quantity = 20,
  String value = '',
  String flagEnd = '...',
}) {
  List<String> chars = value.split('');
  String newValue = chars.sublist(0, quantity).join('');

  return '$newValue$flagEnd';
}
