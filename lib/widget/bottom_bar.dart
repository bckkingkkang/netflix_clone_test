import 'package:flutter/material.dart';

// BottomBar의 경우 상태관리가 필요없는 위젯이기 때문에 StatelessWidget 사용
class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color : Colors.black,
      child : Container(
        height : 50,
        child : TabBar(
          labelColor : Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs : <Widget> [
            // 4개의 각 탭 생성
            Tab(
              icon : Icon(
                Icons.home,
                size : 18,
              ),
              child : Text(
                'Home',
                style : TextStyle(
                  fontSize : 9,
                )
              )
            ),
            Tab(
              icon : Icon(
                Icons.search,
                size : 18,
              ),
              child : Text(
                'Search',
                style : TextStyle(
                  fontSize : 9,
                )
              )
            ),
            Tab(
              icon : Icon(
                Icons.save_alt,
                size : 18,
              ),
              child : Text(
                'Save',
                style : TextStyle(
                  fontSize : 9,
                )
              )
            ),
            Tab(
              icon : Icon(
                Icons.list,
                size : 18,
              ),
              child : Text(
                'More',
                style : TextStyle(
                  fontSize : 9,
                )
              )
            ),
          ]
        ),
      ),
    );
  }
}

