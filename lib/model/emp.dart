import 'package:flutter/material.dart';

class Emp {
  final String id;
  final String name;
  final String dept;
  final String dos;
  final double salary;

  const Emp({
    @required this.id,
    @required this.name,
    @required this.dept,
    @required this.dos,
    @required this.salary,
  });
}