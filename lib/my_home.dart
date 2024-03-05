import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic/question_displaly.dart';
import 'Methods.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  File? image;
  File? croppedImage;

  @override
  Widget build(BuildContext context) {
    final questoinController = TextEditingController();
    final answerController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
         //   mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20,),
              Text('Create Flash Card',style: TextStyle(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Align(child: Text('Image (Optional)',style: TextStyle(fontSize: 22,color: Colors.grey),) ,alignment: Alignment.topLeft,),
              ),






              Container(
                height: MediaQuery.of(context).size.height*.35,
                width: MediaQuery.of(context).size.height*.35,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),

                child: image != null
                    ? GestureDetector(
                  onTap: () async {
                    File? croppedImage = await cropImage(image);
                    if (croppedImage != null) {
                      setState(() {
                        image = croppedImage;
                      });
                    }
                  },
                  child: image != null
                      ? Image.file(
                    image!,
                    fit: BoxFit.cover,
                  )
                      : Container(), // or some placeholder widget
                )

                    : Center(
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo,size: 60,),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: const Text('Add image From'),
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () async {
                                        image = await pickImage(
                                            ImageSource.camera);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: const Text(' Camera'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () async {
                                        image = await pickImage(
                                            ImageSource.gallery);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: const Text('Gallery'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {},
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Cancel')),
                                    ),
                                  ],
                                );
                              });
                        },

                      )),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Align(child: Text('Question',style: TextStyle(fontSize: 22,),) ,alignment: Alignment.topLeft,),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height*.2,

                width: MediaQuery.of(context).size.width*.7,
                decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: questoinController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                        questoinController.clear();
                      },icon: Icon(Icons.clear)),
                      hintText: '  Add Question...',hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Align(child: Text('Answer',style: TextStyle(
                  fontSize: 22,),) ,alignment: Alignment.topLeft,),
              ),

              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height*.2,

                width: MediaQuery.of(context).size.width*.7,
                decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: answerController,
                  decoration: InputDecoration(
                    suffixIcon:IconButton(onPressed: (){
                      answerController.clear();
                    },icon: Icon(Icons.clear)),
                    hintText: '  Add Answer... ',hintStyle: TextStyle(color: Colors.grey),
                   border: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuestionDisplay(questoinController.text)),
                    );
                  },
                  child: Text('Preview')),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
