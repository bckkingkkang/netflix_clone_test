import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/widget/box_slider.dart';
import 'package:netflix_clone_test/widget/carousel_slider.dart';
import 'package:netflix_clone_test/widget/circle_slider.dart';

// 상단바 + 콘텐츠 영역을 포함하는 HomeScreen 위젯

// 영화 데이터는 백엔드에서 가져오기 때문에 StatefulWidget 사용
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 영화 더미 데이터 생성
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('moive').snapshots();
  }

  // streamData로부터 데이터를 추출하여 위젯으로 만들기
  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream : FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    List<Movie> movies = snapshot.map((d) => Movie.fromSnapshot(d)).toList(); 
    // return TopBar();
    // 기존 TopBar를 지우고 ListView 안에 Stack을 넣는 구조로 수정
    return ListView(children : <Widget>[
      Stack(children : <Widget>[
          // Stack의 경우 children 안에 선언한 순서대로 쌓임
          CarouselImage(movies: movies),
          TopBar(),
        ]
      ),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies,)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // return TopBar();
    // 기존 TopBar를 지우고 ListView 안에 Stack을 넣는 구조로 수정
    /*return ListView(children : <Widget>[
      Stack(children : <Widget>[
          // Stack의 경우 children 안에 선언한 순서대로 쌓임
          CarouselImage(movies: movies),
          TopBar(),
        ]
      ),
      CircleSlider(movies: movies),
      BoxSlider(movies: movies,)
    ]);*/
    // 해당 내용 _buildBody로 옮김
    return _fetchData(context);
  }
}

// Home 화면의 상단바 같은 경우 home 화면에서만 사용되기 때문에 별도의 위젯으로 분리하지 않음
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.fromLTRB(20, 7, 20, 7),
      child : Row(
        // 각 항목들 사이에 동일한 간격 부여
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : <Widget> [
          Image.asset(
            'images/Netflix_test.png', 
            fit: BoxFit.contain, 
            height: 25,
          ),
          // 텍스트 부분은 Container로 감싸서 여백 조절
          Container(
            padding : EdgeInsets.only(right : 1),
            child : Text(
              'TV 프로그램',
              style : TextStyle(fontSize : 14),
            ),
          ),
          Container(
            padding : EdgeInsets.only(right : 1),
            child : Text(
              '영화',
              style : TextStyle(fontSize : 14),
            ),
          ),
          Container(
            padding : EdgeInsets.only(right : 1),
            child : Text(
              '내가 찜한 콘텐츠',
              style : TextStyle(fontSize : 14),
            ),
          ),
        ]
      )
    );
  }
}