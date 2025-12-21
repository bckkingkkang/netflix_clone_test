import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/screen/detail_screen.dart';

class likeScreen extends StatefulWidget {
  @override
  _likeScreenState createState() => _likeScreenState();
}

class _likeScreenState extends State<likeScreen> {
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('movie').where('like', isEqualTo: true).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs.cast<DocumentSnapshot<Map<String, dynamic>>>());
      }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    // expanded : 부모의 남은 공간을 모두 차지하도록 하는 위젯
    return Expanded(
      child : GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1/1.5,
        padding : EdgeInsets.all(3),
        children : snapshot.map((data)=>_buildListItem(context, data)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot<Map<String, dynamic>> data) {
    final movie = Movie.fromSnapshot(data);
    return InkWell(
      child : Image.network(movie.poster),
      onTap : () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
          fullscreenDialog: true, 
          builder : (BuildContext context) {
            return DetailScreen(movie: movie);
          }
        ));
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    // StreamBuilder를 통해 영화 데이터를 가져온다
  }
}