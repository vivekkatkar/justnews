import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
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

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        filePath = result.files.first.path;
      });
    }
  }

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
                onTap: pickFile,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: filePath != null
                        ? Text(
                            'File Selected: $filePath',
                            textAlign: TextAlign.center,
                          )
                        : Icon(
                            Icons.cloud_upload,
                            size: 48,
                            color: Colors.grey,
                          ),
                  ),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => home()),
                      );
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
