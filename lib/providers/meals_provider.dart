//import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/dummy_data.dart';

final mealprovider = Provider((ref) {
  return dummyMeals;
});


