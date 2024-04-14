import 'dart:developer';

import 'package:flutter/material.dart';

class DreamProvider with ChangeNotifier {
  String _dreamText = '';
  bool get isSaveButtonEnabled => _dreamText.isNotEmpty;

  void updateDreamText(String text) {
    _dreamText = text;
    notifyListeners(); // 상태 변경 알림
  }

  // 저장 로직 추가 (예시로는 단순히 상태 업데이트만 포함)
  void saveDream() {
    // 여기에 실제 저장 로직 구현
    log("Dream saved: $_dreamText");
    _dreamText = ''; // 저장 후 초기화
    notifyListeners(); // 상태 변경 알림
  }
}
