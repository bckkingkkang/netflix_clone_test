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
                                Container(

                                ),
                              ]
                            )
                          ),
                        ),
                      )
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}