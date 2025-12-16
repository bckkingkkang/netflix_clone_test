import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';

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
    return Container(

    );
  }
}