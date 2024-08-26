extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(
        ' ',
      )
      .map((str) => str.toCapitalize())
      .join(' ');
}
