class Movie {
  // 영화 모델에 들어갈 요소들을 final로 선언
  late final String title;
  late final String keyword;
  late final String poster;
  late bool like;

  // Map을 받아서 Movie 객체를 생성하는 생성자
  // JSON/Map 데이터를 Movie 객체로 변환하는 factory-like 생성자
  Movie.fromMap(Map<String, dynamic> map)
  : title = map['title'],
    keyword =map['keyword'],
    poster = map['poster'],
    like = map['like'];

  // 인스턴스를 출력할 때 용이하게 하기 위해
  @override
  String toString() => "Movie<$title:$keyword>";
}