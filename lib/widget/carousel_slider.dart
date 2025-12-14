import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';

// 해당 위젯은 단순히 이미지를 보여주는 역할뿐만 아니라 찜하기 기능, 그리고 정보 버튼을 통해 
// 디테일 페이지를 띄우는 기능을 담고 있기 때문에 StatefulWidget으로 구현
class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  // 홈 화면에서 CarouselImage 위젯을 생성할 때 영화 데이터 리스트를 전달받음
  // CarouselImage의 생성자를 통해 movies 데이터를 받음
  CarouselImage({required this.movies});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  // state로 관리해줄 변수 선언
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;

  // CarouselImage에서 어느 위치에 있는지 index를 저장할 _currentPage 생성
  int _currentPage = 0;
  // currentPage에 기록되어 있는 현재 keyword 선언
  late String _currentKeyword;

  @override
  void initState() {  // 위젯이 생성될 때 단 한 번 실행되는 메소드
    super.initState();

    /*
    상위 클래스인 StatefulWidget에서 가져온 movies를 참조할 수 있도록 값을 가져온다
    movies 리스트를 순회하면서 각 영화의 poster 값을 이용해 리스트 생성
    부모에서 받은 영화 데이터를 UI와 상태 관리에 맞게 분해해서 State 변수로 저장
    */
    // 원본 영화 데이터
    movies = widget.movies;
    // UI용 이미지 위젯
    images = movies.map((m) => Image.asset('./images/' + m.poster)).toList();
    // 키워드 리스트
    keywords = movies.map((m) => m.keyword).toList();
    // 좋아요 상태 리스트
    likes = movies.map((m) => m.like).toList();
    // 현재 선택 상태 리스트
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}