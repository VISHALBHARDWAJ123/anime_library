import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get formatDate => DateFormat('yyyy-MM-dd').format(this);
}
