import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Center(
        child : Column(
          children : <Widget> [
            Container(
              padding : EdgeInsets.only(top:50),
              child : CircleAvatar(
                radius : 100,
                backgroundImage : AssetImage('images/Netflix_test.png')
              ),
            ),
            Container(
              padding : EdgeInsets.only(top:15,),
              child : Text(
                'Kahyun',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize : 25,
                  color : Colors.white,
                ),
              ),
            ),
            // 프로필 이름 밑줄
            Container(
              padding : EdgeInsets.all(10),
              width : 140,
              height : 5,
              color : Colors.red,
            ),
            // 공유 주소 (예시로 깃허브 주소를 넣음)
            Container(
              padding : EdgeInsets.all(10),
              child : Linkify(
                onOpen : (link) async {
                  if(await canLaunch(link.url)) {
                    await launch(link.url);
                  }
                },
                text : 'https://github.com/bckkingkkang',
                style : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize : 20,
                ),
                linkStyle: TextStyle(
                  color : Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 각진 버튼
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(width: 10),
                    Text('프로필 수정하기'),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
  
}

