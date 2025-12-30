import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:meals/data/dummy.dart";

final mealsProvider = Provider((b) {
  // Provider class needs an object a s apositional argument
  return dummyMeals;
});
