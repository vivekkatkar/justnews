import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'home.dart';

class NewsPostScreen extends StatefulWidget {
  @override
  _NewsPostScreenState createState() => _NewsPostScreenState();
}

class _NewsPostScreenState extends State<NewsPostScreen> {
  bool autonomousNews = false;
  String? filePath;
  TextEditingController headlineController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }else{
        print("No Image Picked");
      }
      
    });
  }

  final _auth = FirebaseAuth.instance;
  final _ref = FirebaseDatabase.instance.ref("Posts");
  firebase_storage.FirebaseStorage _storage = firebase_storage.FirebaseStorage.instance;


  void addPost() async {
    final User? user = _auth.currentUser;
    String userid = user!.uid!.toString();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    String n = "/" + userid;
    firebase_storage.Reference store_ref = firebase_storage.FirebaseStorage.instance.ref(n+id);

    firebase_storage.UploadTask uploadTask = store_ref.putFile(_image!.absolute);
    await Future.value(uploadTask);

    final newUrl = await store_ref.getDownloadURL();

    _ref.child(userid).child(id).set(
      {
        'postid' : id,
        'headline' : headlineController.text.toString(),
        'desc' : descriptionController.text.toString(),
        'date' : selectedDate.toString(),
        'time' : selectedTime.toString(),
        'filepath' : newUrl.toString(),
        'isAccepeted' : false,
      }
    ).then((value) {
      print("Post Added to Database");
    }).catchError((error, stackTrace){
      print(error.toString());
    });
  }



  // void pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null && result.files.isNotEmpty) {
  //     setState(() {
  //       filePath = result.files.first.path;
  //     });
  //   }
  // }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Create New Post',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NOTE:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Ensure the credibility of your news by including supporting evidence such as videos, images, or any relevant proofs. Authenticity matters, and your contributions with verifiable content enhance the reliability of our news application.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              TextField(
                controller: headlineController,
                decoration: InputDecoration(
                  labelText: 'Headline',
                  prefixIcon: Icon(Icons.title),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.description),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Text(
                    'Select Date: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  selectedDate != null
                      ? Text(
                          "${selectedDate!.toLocal()}".split(' ')[0],
                          style: TextStyle(color: Colors.black),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Text(
                    'Select Time: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Select Time'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  selectedTime != null
                      ? Text(
                          "${selectedTime!.hour}:${selectedTime!.minute}",
                          style: TextStyle(color: Colors.black),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: (){
                  getImage();
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _image == null ? Icon(Icons.image) : Image.file(_image!.absolute),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: autonomousNews,
                    onChanged: (newValue) {
                      setState(() {
                        autonomousNews = newValue!;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                  ),
                  Text('Do you want your news to be autonomous?'),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200, // Adjust the width as needed
                  child: ElevatedButton(
                    onPressed: () {

                      addPost();

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => home()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                    child: Text('SUBMIT'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
