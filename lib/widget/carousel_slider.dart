import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/screen/detail_screen.dart';

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
    images = movies.map((m) => Image.asset(m.poster)).toList();
    // 키워드 리스트
    keywords = movies.map((m) => m.keyword).toList();
    // 좋아요 상태 리스트
    likes = movies.map((m) => m.like).toList();
    // 현재 선택 상태 리스트
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    // carousel_slider 패키지 설치
    return Container(
      child : Column(
        children : <Widget> [
          Container(
            padding : EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
          ),
          // 이미지 하단 키워드(설명) 표시
          Container(
            padding : EdgeInsets.fromLTRB(0, 10, 0, 3),
            child : Text(
              _currentKeyword,
              style : TextStyle(fontSize : 11),
            ),
          ),
          // 메뉴바 생성
          Container(
            child : Row(
              // 간격 동일하게 배치
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : <Widget>[
                // 내가 찜한 콘텐츠
                Container(
                  child : Column(
                    children : <Widget>[
                      likes[_currentPage]
                      ? IconButton(icon: Icon(Icons.check), onPressed : () {},)
                      : IconButton(icon: Icon(Icons.add), onPressed : () {},),
                      Text(
                        '내가 찜한 콘텐츠', 
                        style : TextStyle(
                          fontSize : 11,
                        )
                      )
                    ]
                  ),
                ),
                // 재생 버튼
                Container(
                  padding : EdgeInsets.only(right : 10),
                  child : TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,      
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow, 
                          color:Colors.black
                        ),
                        Padding(
                          padding : EdgeInsets.all(3),
                        ),
                        Text(
                          '재생',
                          style : TextStyle(color:Colors.black, ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 목록 버튼
                Container(
                  padding : EdgeInsets.only(right : 10),
                  child : Column(
                    children : <Widget>[
                      IconButton(icon : Icon(Icons.info), onPressed : () {
                          // detail_screen.dart의 DetailScreen으로 이동
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                            fullscreenDialog: true, 
                            builder : (BuildContext context) {
                              return DetailScreen(
                                movie : movies[_currentPage],
                              );
                            }));
                        },
                      ),
                      Text(
                        '정보',
                        style : TextStyle(fontSize:11),
                      )
                    ]
                  )
                ),
              ]
            ),
          ),
          // 캐러셀 위치 표시 인디케이터
          Container(child : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children : makeIndicator(likes, _currentPage)
            )
          )
        ]
      )
    );
  }
}

// 지금 캐러셀에서 몇 번째 페이지를 보고 있는지”를 시각적으로 알려주기 위해 indicator 위젯을 별도로 구현
List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width : 8,
      height : 8,
      margin : EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 2.0,
      ),
      decoration : BoxDecoration(
        shape : BoxShape.circle,
        color : _currentPage == i
          ? Color.fromRGBO(255, 255, 255, 0.9)
          : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }
  return results;
}