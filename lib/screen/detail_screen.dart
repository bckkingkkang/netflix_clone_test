import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'dart:ui' as ui;

class DetailScreen extends StatefulWidget{
  final Movie movie;
  DetailScreen({required this.movie});

  @override
  _DetailScreenState createState() => _DetailScreenState();

}

class _DetailScreenState extends State<DetailScreen>{
  bool like = false;

  @override
  void initState() {
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context){
    // 팝업 다이얼로그 형태로 띄우기 위해 Scaffold 사용
    return Scaffold(
      body : Container(
        child : SafeArea(
          child : ListView(
            children : <Widget> [
              // Stack을 사용해 상단 부분 작성
              Stack(
                children : <Widget> [
                  // 블러 처리된 이미지 위에 텍스트 부분까지 작성
                  Container(
                    width : double.maxFinite,
                    decoration : BoxDecoration(
                      image : DecorationImage(
                        image:AssetImage(widget.movie.poster),
                        fit : BoxFit.cover,
                      )
                    ),
                    child : ClipRect(
                      child : BackdropFilter(
                        filter : ImageFilter.blur(
                          sigmaX:10, 
                          sigmaY:10
                        ),
                        child : Container(
                          alignment: Alignment.center,
                          color : Colors.black.withAlpha(26),
                          child : Container(
                            child : Column(
                              children : <Widget>[
                                Container(
                                  padding : EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child : Image.asset(widget.movie.poster),
                                  height: 300,
                                ),
                                Container(
                                  padding : EdgeInsets.all(7),
                                  child : Text(
                                    '99% 일치 2019 15+ 시즌 1개',
                                    textAlign: TextAlign.center,
                                    style : TextStyle(fontSize : 13),
                                  )
                                ),
                                // 영화 title
                                Container(
                                  padding :EdgeInsets.all(7),
                                  child : Text(
                                    widget.movie.title,
                                    textAlign : TextAlign.center,
                                    style : TextStyle(
                                      fontWeight : FontWeight.bold,
                                      fontSize : 16,
                                    ),
                                  ),
                                ),
                                // 재생 버튼
                                Container(
                                  padding: EdgeInsets.all(3),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget> [
                                        Icon(Icons.play_arrow),
                                        SizedBox(width: 4),
                                        Text('재생'),
                                      ],
                                    ),
                                  ),
                                ),
                                // 영화에 대한 설명을 표시할 Container
                                Container(
                                  padding : EdgeInsets.all(5),
                                  child : Text(
                                    // 대략적으로 표시(생략)
                                    widget.movie.toString()
                                  ),
                                ),
                                // 영화 출연진
                                Container(
                                  padding : EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child : Text(
                                    '출연 : 현빈, 손예진, 서지혜\n제작자 : 이정호, 박지은',
                                    style : TextStyle(
                                      color : Colors.white60,
                                      fontSize : 12,
                                    ),
                                  ),
                                ),
                              ]
                            )
                          ),
                        ),
                      )
                    )
                  ),
                  Positioned(
                    child : AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ],
              ),
              // 메뉴바 생성
              Container(
                color : Colors.black26,
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children : <Widget> [
                    // 내가 찜한 콘텐츠 버튼
                    Container(
                      padding : EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child : InkWell(
                        onTap : () {},
                        child : Column(
                          children: <Widget>[
                            like ? Icon(Icons.check) : Icon(Icons.add),
                            Padding(
                              padding : EdgeInsets.all(5),
                            ),
                            Text(
                              '내가 찜한 콘텐츠',
                              style : TextStyle(
                                fontSize : 11,
                                color : Colors.white60,
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    // 평가 (thumb_up) 버튼
                    Container(
                      padding : EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child : Container(
                        child : Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(
                              padding : EdgeInsets.all(5),),
                            Text(
                              '평가',
                              style : TextStyle(
                                fontSize : 11,
                                color : Colors.white60,
                              ),
                            ),
                          ]
                        ,)
                      ),
                    ),
                    // 공유 버튼
                    Container(
                      padding : EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child : Container(
                        child : Column(
                          children: <Widget>[
                            Icon(Icons.send),
                            Padding(
                              padding : EdgeInsets.all(5),),
                            Text(
                              '공유',
                              style : TextStyle(
                                fontSize : 11,
                                color : Colors.white60,
                              ),
                            ),
                          ]
                        ,)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}