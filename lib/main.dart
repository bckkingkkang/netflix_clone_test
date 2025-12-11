import 'package:flutter/material.dart';
import 'package:netflix_clone_test/widget/bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController를 전역 변수로 선언
  late TabController controller;
  // 실제 Flutter에서 컨트롤러는 거의 모두 late 추천
  
  @override
  Widget build(BuildContext context) {
    // 내비게이션 탭 구조 작성 이전에 기본적인 MaterialApp 설정
    return MaterialApp(
      title : 'KahyunFlix',
      theme:ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
          secondary: Colors.white,
        ),
      ),
      // home 설정 - DefaultTabController로 관리
      home : DefaultTabController(
        length: 4, // TabBar의 길이
        child: Scaffold(
          body:TabBarView(
            physics: NeverScrollableScrollPhysics(), // 스와이프 비활성화
            // children 설정 - 각 탭에 해당하는 위젯들
            children : <Widget> [
              Container(),
              Container(),
              Container(),
              Container(),
            ]
          ),
          // Navigation Bar 설정
          bottomNavigationBar: Bottom(), // Widget -> bottom_bar.dart 생성
        )
      )
    );
  }
}