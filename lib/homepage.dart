import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> Speak(String text) async {
    flutterTts.setLanguage('en-US');
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Converted to Speech",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(padding: EdgeInsets.all(20),
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
          TextField( 
            controller: textEditingController,
            decoration:const InputDecoration( 
              hintText: "Enter Text",
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
          ),
          const SizedBox(height: 20,),

          ElevatedButton(onPressed: (){ 
            Speak(textEditingController.text);
          }, child: Center(child: Text("Speak")))
        ],
      ),),
    );
  }
}
