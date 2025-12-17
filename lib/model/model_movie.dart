import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  // 영화 모델에 들어갈 요소들을 final로 선언
  late final String title;
  late final String keyword;
  late final String poster;
  late bool like;

  // DocumentReference : 실제 Firebase에 있는 데이터 컬럼을 참조할 수 있는 링크
  // reference를 이용해서 해당 데이터에 대한 CRUD 기능을 간단히 처리 가능
  late final DocumentReference reference;

  // Map을 받아서 Movie 객체를 생성하는 생성자
  // JSON/Map 데이터를 Movie 객체로 변환하는 factory-like 생성자
  Movie.fromMap(Map<String, dynamic> map, {required this.reference})
  : title = map['title'],
    keyword =map['keyword'],
    poster = map['poster'],
    like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
    :this.fromMap(
      snapshot.data()!,
      reference : snapshot.reference,
    );

  // 인스턴스를 출력할 때 용이하게 하기 위해
  @override
  String toString() => "Movie<$title:$keyword>";
}