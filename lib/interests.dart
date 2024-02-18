import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'What are you interested in?',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "login");
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Container(
                height: 10,
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
                horizontal: 16.0, vertical: 11.0), // Adjusted padding
            child: Container(
              height: 50.0, // Adjusted height
              decoration: BoxDecoration(
                color: Colors.black, // Background color
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "homepage");
                },
                child: Center(
                  child: Text(
                    'Select any Two',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0, // Reduced font size
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
            imagePath: 'assets/images/Politics.jpg', newsName: 'Politics'),
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
        padding: EdgeInsets.all(8.0), // Adjust the padding as needed
        child: Container(
          child: FractionallySizedBox(
            widthFactor: 0.8, // Adjusted width factor
            heightFactor: 0.8, // Adjusted height factor
            child: AspectRatio(
              aspectRatio: 1.2, // Adjusted aspect ratio
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjusted border radius
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
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14), // Reduced font size
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
