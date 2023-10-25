import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final String articleTitle;
  final String articleAuthor;
  final String articleDate;
  final String articleDuration;
  final String articleImage;

  ArticleScreen({
    required this.articleTitle,
    required this.articleAuthor,
    required this.articleDate,
    required this.articleDuration,
    required this.articleImage,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(articleImage),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articleTitle,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    Container(
        child: Row(
          children: <Widget>[
            Text('$articleAuthor',style: TextStyle(
              color: Colors.grey
            ),),
            SizedBox(width: 16.0),
            Text('$articleDate',style: TextStyle(
              color: Colors.grey
            )),
            SizedBox(width: 16.0),
            Text('$articleDuration read',style: TextStyle(
              color: Colors.grey
            )),
          ],
        ),
            
      ),
                ],
              ),
            ),
            Text("This is the body of the article",style: TextStyle(
              fontSize: 20
            ),)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/Home.jpg', width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Group.jpg', width: 24, height: 24),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Notifications.jpg', width: 24, height: 24),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Profile.jpg', width: 24, height: 24),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          
          
        },
      ),
    );
  }
}
