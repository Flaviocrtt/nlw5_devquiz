import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(0);
  int get currentePage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
}
