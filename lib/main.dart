import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TravelNewsApp());
}

class TravelNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/user_profile.jpg'),
                ),
                Text('Welcome Back, User',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('$formattedDate'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return buildArticleItem(articles[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArticleItem(Article article) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(article.imagePath),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 16.0,
                      backgroundImage: AssetImage(article.authorProfileImage),
                    ),
                    SizedBox(width: 8.0),
                    Text(article.authorName),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Article {
  final String imagePath;
  final String title;
  final String authorName;
  final String authorProfileImage;

  Article({
    required this.imagePath,
    required this.title,
    required this.authorName,
    required this.authorProfileImage,
  });
}

List<Article> articles = [
  Article(
    imagePath: 'assets/article1.jpg',
    title: 'Why are people leaving from Canada?',
    authorName: 'Katya Sitak',
    authorProfileImage: 'assets/author1.jpg',
  ),
  Article(
    imagePath: 'assets/article2.jpg',
    title: 'Why is the internet speed slow in the Philippines?',
    authorName: 'Luke Skywalker',
    authorProfileImage: 'assets/author2.jpg',
  ),
  
];
