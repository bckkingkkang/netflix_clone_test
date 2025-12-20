import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_test/model/model_movie.dart';
import 'package:netflix_clone_test/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  // 검색 위젯을 컨트롤하는 위젯
  final TextEditingController _filter = TextEditingController();
  // 텍스트에디트 위젯에 현재 커서가 위치하는지 알려주는 위젯
  FocusNode focusNode = FocusNode();
  // 현재 검색어 값
  String _searchText = "";

  // 텍스트에디트 위젯을 컨트롤 하는 필터가 상태변화를 감지하여 searchText를 filter의 값으로 변경
  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  // 검색 결과를 만들어주는 함수
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs.cast<DocumentSnapshot<Map<String, dynamic>>>());
      });
  }

  Widget _buildList(BuildContext context,List<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
    List<DocumentSnapshot<Map<String, dynamic>>> searchResults = [];

    for (final d in snapshot) {
      final data = d.data();
      if (data != null && data.toString().contains(_searchText)) {
        searchResults.add(d);
      }
    }
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding: const EdgeInsets.all(3),
        children:
          searchResults.map((d) => _buildListItem(context, d)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot<Map<String, dynamic>> data) {
    final movie = Movie.fromSnapshot(data);
    return InkWell(
      child : Image.network(movie.poster),
      onTap : () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
          fullscreenDialog : true,
          builder : (BuildContext context) {
            return DetailScreen(movie : movie);
          }
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Column(
        children : <Widget>[
          Padding(
            padding :EdgeInsets.all(30),
          ),
          Container(
            color : Colors.black,
            padding : EdgeInsets.fromLTRB(5, 10, 5, 10),
            child : Row(
              children : <Widget> [
                Expanded(
                  flex : 6,
                  child : TextField(
                    focusNode: focusNode,
                    style : TextStyle(
                      fontSize:15,
                    ),
                    autofocus: true,
                    controller : _filter,
                    decoration: InputDecoration(
                      filled : true, 
                      fillColor : Colors.white12,
                      prefixIcon : Icon(
                        Icons.search,
                        color : Colors.white60,
                        size : 20,
                      ),
                      suffixIcon : focusNode.hasFocus 
                        ? IconButton(
                            icon : Icon(
                              Icons.cancel, 
                              size : 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _filter.clear();
                                _searchText = "";
                              }); 
                            },
                          ) 
                        : Container(),
                      hintText : '검색',
                      labelStyle : TextStyle(
                        color : Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide : BorderSide(color:Colors.transparent),
                        borderRadius : BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide : BorderSide(color:Colors.transparent),
                        borderRadius : BorderRadius.all(Radius.circular(10)),
                      ),
                      border : OutlineInputBorder(
                        borderSide : BorderSide(color:Colors.transparent),
                        borderRadius : BorderRadius.all(Radius.circular(10)),
                      ), 
                    ),
                  ),
                ),
                // 취소 버튼 (포커스가 있는 경우에만 나오도록)
                focusNode.hasFocus 
                  ? Expanded(
                      child : TextButton(
                        child : Text(
                          '취소', 
                          style : TextStyle(
                            color : Colors.white60,
                          ),
                        ),
                        onPressed: () {
                          setState((){
                            _filter.clear();
                            _searchText = "";
                            focusNode.unfocus();
                          });
                        },
                      )
                  )
                  : Expanded(
                      flex : 0,
                      child : Container(),
                  )
              ],
            ),
          ),
          _buildBody(context),
        ],
      ),
    );
  }
}