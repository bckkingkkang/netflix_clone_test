import 'package:flutter/material.dart';

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
          )
        ],
      ),
    );
  }
}