import 'package:flutter/material.dart';

void main() {
  runApp(MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                'What are you interested in?',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFFD2D5D2), // Background color #d2d5d2
                ),
                child: NewsGrid(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0), // Adjust the horizontal padding as needed
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFBE6D41), // Background color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: InkWell(
                onTap: () {
                  // Handle button tap
                },
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 9.0),
                    child: Text(
                      'Select any 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 2 buttons per row
      mainAxisSpacing: 2.0, // Adjust the vertical spacing
      crossAxisSpacing: 2.0, // Adjust the horizontal spacing
      children: [
        NewsButton(imagePath: 'assets/images/local.png', newsName: 'Local'),
        NewsButton(
            imagePath: 'assets/images/Technology.jpg', newsName: 'Technology'),
        NewsButton(imagePath: 'assets/images/sports.jpg', newsName: 'Sports'),
        NewsButton(
            imagePath: 'assets/images/bussiness.jpg',
            newsName: 'Business & Finance'),
        NewsButton(
            imagePath: 'assets/images/Politics.jpg',
            newsName: 'Politics'), // Add more buttons as needed
        NewsButton(
            imagePath: 'assets/images/International.png',
            newsName: 'International'),
      ],
    );
  }
}

class NewsButton extends StatelessWidget {
  final String imagePath;
  final String newsName;

  NewsButton({required this.imagePath, required this.newsName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle button tap
      },
      child: Container(
        padding: EdgeInsets.all(0.3), // Adjust the padding as needed
        child: Container(
          child: FractionallySizedBox(
            widthFactor: 0.7,
            heightFactor: 0.7,
            child: AspectRatio(
              aspectRatio: 1.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.all(4.0),
                        color: Colors.black54.withOpacity(0.5),
                        child: Text(
                          newsName,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
