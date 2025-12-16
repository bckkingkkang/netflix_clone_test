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
                  Container(
                    width : double.maxFinite,
                    decoration : BoxDecoration(
                      image : DecorationImage(
                        image:AssetImage(widget.movie.poster),
                        fit : BoxFit.cover,
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