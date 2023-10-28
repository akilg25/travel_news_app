import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_news_app/SecondScreen.dart';

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
  int currentIndex = 0;
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
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for article...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return buildArticleItem(context, articles[index]);
              },
            ),
          ),
        ],
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

  Widget buildArticleItem(BuildContext context,Article article) {
    String formattedDate = DateFormat('EEEE, MMMM d').format(DateTime.now());
  return Card(
    margin: EdgeInsets.all(16.0),
    child: InkWell(
      onTap: () {
        
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleScreen(
              articleTitle: article.title,
              articleAuthor: article.authorName,
              articleDate: article.articlePublishDate, 
              articleDuration: '5 min', 
              articleImage: article.imagePath,
              authorProfileImage: article.authorProfileImage,
              articleContents: article.articleContents,
              
            ),
          ),
        );
      },
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
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 16.0,
                      backgroundImage: AssetImage(article.authorProfileImage),
                    ),
                    SizedBox(width: 8.0),
                    Text(article.authorName),
                    Text("         "+article.articlePublishDate),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  

  
}


class Article {
  final String imagePath;
  final String title;
  final String authorName;
  final String authorProfileImage;
  final String articleContents;
  final String articlePublishDate;
  

  Article({
    required this.imagePath,
    required this.title,
    required this.authorName,
    required this.authorProfileImage,
    required this.articleContents,
    required this.articlePublishDate,
  });
}

List<Article> articles = [
  Article(
    imagePath: 'assets/article1.jpg',
    title: 'Why are people leaving from Canada?',
    authorName: 'Katya Sitak',
    authorProfileImage: 'assets/author1.jpg',
    articleContents: "People are moving away from Canada because it's expensive to buy homes, other countries offer better jobs, and some prefer warmer weather. Some people are also leaving because of their own or their family's reasons.",
    articlePublishDate: "August 23",
  ),
  Article(
    imagePath: 'assets/article2.jpg',
    title: 'Why is the internet speed slow in the Philippines?',
    authorName: 'Luke Skywalker',
    authorProfileImage: 'assets/author2.jpg',
    articleContents: "The internet is slow in the Philippines because some places don't have good internet equipment, the country has lots of islands which make it harder to connect, and it's difficult to provide fast internet in far-away areas. ",
    articlePublishDate: "June 2",
  ),
  
];
