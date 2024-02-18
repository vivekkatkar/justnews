import 'package:flutter/material.dart';
import 'package:justnews/home.dart';
import 'package:justnews/uploadnews.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar color
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => home()),
            );
          },
        ),
        title: Text('Create New Post'),
      ),
      body: Container(
        color: Color.fromARGB(
            255, 255, 255, 254), // Set container background color
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black, // Set container background color
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Terms and Conditions:',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      _buildTermsAndConditionsList(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  checkColor: Colors.white, // Set the color of the tick
                  activeColor: Colors.black,
                ),
                Text(
                  'I agree to the terms and conditions',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _isChecked
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsPostScreen()),
                      );
                    }
                  : null, // This will disable the button if _isChecked is false
              child: Text('Accept All'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Set button background color
                onPrimary: Colors.white, // Set button foreground color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsAndConditionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTermItem(
            'By using this news app, you agree to the following terms.'),
        _buildTermItem(
            'Accuracy of Information: You acknowledge and agree that any information you provide through this app is accurate and truthful to the best of your knowledge.'),
        _buildTermItem(
            'Responsibility for Content: You are solely responsible for the accuracy and authenticity of the information you submit. The app and its administrators are not liable for any false or misleading information provided by users.'),
        _buildTermItem(
            'Consequences of Misinformation: In the event that false information is submitted, you accept full responsibility for any consequences that may arise. This includes, but is not limited to, legal actions, reputational damage, or any harm caused by the dissemination of inaccurate information.'),
        _buildTermItem(
            'Verification of Facts: The app may take measures to verify the accuracy of the information provided, but it does not guarantee the accuracy of every piece of content. Users are encouraged to cross-check information from reliable sources.'),
        _buildTermItem(
            'User Conduct: Users must adhere to ethical standards when submitting information. Any attempt to intentionally mislead, spread misinformation, or engage in harmful behavior will result in account suspension or termination.'),
        _buildTermItem(
            'Modification of Terms: The app reserves the right to modify these terms and conditions at any time. Users will be notified of any changes, and continued use of the app constitutes acceptance of the modified terms.'),
      ],
    );
  }

  Widget _buildTermItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
