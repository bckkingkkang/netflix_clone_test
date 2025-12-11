import 'package:flutter/material.dart';

// 상단바 + 콘텐츠 영역을 포함하는 HomeScreen 위젯

// 영화 데이터는 백엔드에서 가져오기 때문에 StatefulWidget 사용
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Center(
        child : Text('Home Screen'),
      ),
    );
  }
}