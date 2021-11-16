import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String surname;
  final int ID_number;
  final String email;
  final int cellphone;
  final DateTime date;
  final bool gender;
  final String image;

  User({
    required this.name,
    required this.surname,
    required this.ID_number,
    required this.email,
    required this.cellphone,
    required this.date,
    required this.gender,
    required this.image,
  });
}
