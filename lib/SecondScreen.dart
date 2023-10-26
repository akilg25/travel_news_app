import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  final String articleTitle;
  final String articleAuthor;
  final String articleDate;
  final String articleDuration;
  final String articleImage;
  final String authorProfileImage;
  final String articleContents;

  ArticleScreen({
    required this.articleTitle,
    required this.articleAuthor,
    required this.articleDate,
    required this.articleDuration,
    required this.articleImage,
    required this.authorProfileImage,
    required this.articleContents,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      
                      Navigator.of(context).pop();
                    },
                  ),
                  IconButton(
                    icon: Image.asset('assets/Group.jpg', width: 24, height: 24),
                    onPressed: () {
                      
                      Navigator.of(context).popUntil(ModalRoute.withName("/"));
                    },
                  ),
                ],
              ),
            ),
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
                  SizedBox(height: 10,),
                    Container(
                      
        child: Row(
          children: <Widget>[
            CircleAvatar(
            radius: 13.0,
            backgroundImage: AssetImage(authorProfileImage), 
          ),
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
            Padding(
  padding: EdgeInsets.all(15.0), // Adjust the padding as needed
  child: Text(
    "$articleContents",
    style: TextStyle(
      fontSize: 17,
    ),
  ),
)
            
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
