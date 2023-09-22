import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';


StoryBrain storyBrain =StoryBrain();

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(

       decoration: BoxDecoration(
         image: DecorationImage(
             image: AssetImage("images/hello2.png",),
           fit: BoxFit.cover,
         )
       ),
           child:Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.stretch,

             children: [
               Expanded(flex:12,
                   child: Center
                     (child: Padding(
                       padding: const EdgeInsets.all(14.0),
                       child: Text(

                           storyBrain.getStory()
                           ,

                   ),
                     ))),
               Expanded(flex: 2,
                   child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.red,
                   ),
                   onPressed: (){
                     setState(() {
                       storyBrain.nextStory(1);
                     });

                   },
                   child:Text(storyBrain.getChoice1(),) ,),
               )),
               Expanded(
                   flex: 2,
                   child: Visibility(
                     visible: storyBrain.buttonShouldBeVisible(),
                     child: Padding(
                  padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.blue,
                     ),
                     onPressed: (){
                       setState(() {
                         storyBrain.nextStory(1);
                       });

                     },
                     child: Text( storyBrain.getChoice2(),) ,),
               ),
                   )),
             ],
           )
     ),
    );
  }
}
