import 'dart:convert';
import 'dart:core';

import 'package:flutter/services.dart';

class BibleData{
  // 기존 JSON 데이터
  late Map<String, dynamic> originalData;

  Future<void> getBibleVerses(String book, String chapter, int startVerse, int endVerse) async {
    final String response = await rootBundle.loadString("assets/bible.json");
    originalData = await json.decode(response);

    Map<String, Map<String, Map<String, String>>> data = await transformBible();

    // 특정 범위의 구절을 저장할 리스트
    List<String> verses = [];

    // 선택한 범위의 구절을 가져오기
    for (int i = startVerse; i <= endVerse; i++) {
      String? verseText = data[book]?[chapter]?[i.toString()];
      if (verseText != null) {
        verses.add("$book $chapter:$i - $verseText");
      }
    }

    // 결과 출력
    if (verses.isNotEmpty) {
      print("📖 선택한 범위의 구절:\n${verses.join("\n")}");
    } else {
      print("🚨 해당 범위의 구절을 찾을 수 없습니다!");
    }
  }

  Future<Map<String, Map<String, Map<String, String>>>> transformBible() async{
    // 변환된 데이터 저장할 Map
    Map<String, Map<String, Map<String, String>>> transformedData = {};

    // 데이터 변환
    originalData.forEach((key, value) {
      // "창1:1" → "창", "1", "1" 로 분리
      final match = RegExp(r'([가-힣]+)(\d+):(\d+)').firstMatch(key);
      if (match != null) {
        String bookAbbr = match.group(1)!; // "창"
        String chapter = match.group(2)!; // "1"
        String verse = match.group(3)!; // "1"

        // 약어를 풀네임으로 변환 (예: "창" → "창세기")
        String bookFullName = bookAbbr;//bookNames[bookAbbr] ?? bookAbbr;

        // Map에 데이터 저장
        transformedData.putIfAbsent(bookFullName, () => {});
        transformedData[bookFullName]!.putIfAbsent(chapter, () => {});
        transformedData[bookFullName]![chapter]![verse] = value;
      }
    });
    return transformedData;
  }

  // 책 이름 변환 맵 (약어 → 전체 이름)
  Map<String, String> bookNames = {
    "창": "창세기",
    "출": "출애굽기",
    "레": "레위기",
    "민": "민수기",
    "신": "신명기",
    "수": "여호수아",
    "삿": "사사기",
    "룻": "룻기",
    "삼상": "사무엘상",
    "삼하": "사무엘하",
    "왕상": "열왕기상",
    "왕하": "열왕기하",
    "대상": "역대상",
    "대하": "역대하",
    "스": "에스라",
    "느": "느헤미야",
    "에": "에스더",
    "욥": "욥기",
    "시": "시편",
    "잠": "잠언",
    "전": "전도서",
    "아": "아가",
    "사": "이사야",
    "렘": "예레미야",
    "애": "예레미야애가",
    "겔": "에스겔",
    "단": "다니엘",
    "호": "호세아",
    "욜": "요엘",
    "암": "아모스",
    "옵": "오바댜",
    "욘": "요나",
    "미": "미가",
    "나": "나훔",
    "합": "하박국",
    "습": "스바냐",
    "학": "학개",
    "슥": "스가랴",
    "말": "말라기",
    "마": "마태복음",
    "막": "마가복음",
    "눅": "누가복음",
    "요": "요한복음",
    "행": "사도행전",
    "롬": "로마서",
    "고전": "고린도전서",
    "고후": "고린도후서",
    "갈": "갈라디아서",
    "엡": "에베소서",
    "빌": "빌립보서",
    "골": "골로새서",
    "살전": "데살로니가전서",
    "살후": "데살로니가후서",
    "딤전": "디모데전서",
    "딤후": "디모데후서",
    "딛": "디도서",
    "몬": "빌레몬서",
    "히": "히브리서",
    "약": "야고보서",
    "벧전": "베드로전서",
    "벧후": "베드로후서",
    "요일": "요한1서",
    "요이": "요한2서",
    "요삼": "요한3서",
    "유": "유다서",
    "계": "요한계시록"
  };
}
