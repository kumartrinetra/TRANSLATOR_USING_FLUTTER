import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Translator Application',
      home: MyFirstScreen(),
    );
  }
}

class MyFirstScreen extends StatefulWidget {
  @override
  _LanguagePageTranslationState createState() =>
      _LanguagePageTranslationState();
}

class _LanguagePageTranslationState extends State<MyFirstScreen> {
  var Languages = ['Hindi', 'English', 'Arabic'];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();
  void translate(String src, String dest, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if(src == '--' || dest == '--')
      {
        output = 'Failed to Translate';
      }
  }
  String getLanguage(String language)
  {
    if(language == 'English')
      {
        return 'en';
      }
    else if(language == 'Hindi')
      {
        return 'hi';
      }
    else if(language == 'Arabic')
      {
        return 'ar';
      }
    return '--';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC5C5C5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton(
                icon: Container(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      'assets/images/menu-alt-64.webp',
                    )),
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Container(
                          child: Row(),
                        ),
                      )
                    ]),
            const Text(
              'Anuvaad...',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.w600,
                fontSize: 26,
              ),
            ),
            CircleAvatar(
              foregroundImage: AssetImage(
                  'assets/images/ancient-ink-pot-with-peacock-feather-used-vector-38068167.jpg'),
              radius: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    // width: 50,
                    child: Card(
                      semanticContainer: true,
                      child: Row(
                        children: [
                          Transform.translate(
                            offset: Offset(5, 0),
                            child:
                               CircleAvatar(radius: 13,
                                   backgroundImage: AssetImage('assets/images/img.png'),
                          ),),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              focusColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              hint: Transform.translate(
                                  offset: Offset(12, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        originLanguage,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )),
                              dropdownColor: Colors.white,
                              elevation: 0,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.black,
                              ),
                              items: Languages.map((String DropdownStringItem) {
                                return DropdownMenuItem(
                                  child: Text(DropdownStringItem),
                                  value: DropdownStringItem,
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  originLanguage = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    // width: 50,
                    child: Card(
                      semanticContainer: true,
                      child: Row(
                        children: [
                          Transform.translate(
                            offset: Offset(5, 0),
                            child:
                            CircleAvatar(radius: 13,
                              backgroundImage: AssetImage('assets/images/img.png'),
                            ),),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              focusColor: Colors.white,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                              hint: Transform.translate(
                                  offset: Offset(12, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        destinationLanguage,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )),
                              dropdownColor: Colors.white,
                              elevation: 0,
                              icon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.black,
                              ),
                              items: Languages.map((String DropdownStringItem) {
                                return DropdownMenuItem(
                                  child: Text(DropdownStringItem),
                                  value: DropdownStringItem,
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  destinationLanguage = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 60, width: 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.translate(
                              offset: Offset(-15, 0),
                              child: Container(
                                height: 25,
                                width: 25,
                                child: Image.asset('assets/images/img.png'),
                              ),
                            ),
                            Text(
                              'Hindi',
                              style: TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            Transform.translate(
                              offset: Offset(15, 0),
                              child: Container(
                                  height: 13,
                                  width: 13,
                                  child: Image.asset('assets/images/down-64.webp')),
                            ),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/1194036.png'),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffC5C5C5),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(height: 60, width: 75),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.translate(
                              offset: Offset(-15, 0),
                              child: Container(
                                height: 25,
                                width: 25,
                                child: Image.asset(
                                    'assets/images/Untitled-5-17-64.webp'),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(0, 0),
                              child: Text(
                                'Select',
                                style: TextStyle(fontSize: 13, color: Colors.black),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(12, 0),
                              child: Container(
                                  height: 13,
                                  width: 13,
                                  child: Image.asset('assets/images/down-64.webp')),
                            ),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),*/
              SizedBox(height: 40,),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.black), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(border: InputBorder.none, hintText: 'Please Enter Your Text Here.....', hintStyle: TextStyle(color: Color(0xffA9A9A9),
                      fontWeight: FontWeight.w300, fontSize: 18),
                      contentPadding: EdgeInsets.all(8), errorStyle: TextStyle(color: Colors.red)),
                      controller: languageController,
                      validator: (value) {
                        if(value == null || value.isEmpty)
                          {
                            return 'Please Enter Your Text Here.....';
                          }
                        return null;
                      },
                    ),
                    SizedBox(height: 43,),
                    Row(children: [
                      SizedBox(width: 268,),
                      Container(
                        height: 20,
                          width: 20,
                          child: Image.asset('assets/images/img_1.png')),
                      SizedBox(width: 5,),
                      Container(
                          height: 18,
                          width: 20,
                          child: Image.asset('assets/images/img_2.png')),
                      SizedBox(width: 5,),
                      Container(
                          height: 22,
                          width: 20,
                          child: Image.asset('assets/images/img_3.png')),
                    ],)
                  ],
                ),
              ),
              SizedBox(width: 40,),
              InkWell(onTap: () {
                translate(getLanguage(originLanguage), getLanguage(destinationLanguage), languageController.text.toString());
              },
        
                  child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                      elevation: 5,
                      child: CircleAvatar(radius: 28, backgroundImage: AssetImage('assets/images/ancient-ink-pot-with-peacock-feather-used-vector-38068167.jpg'),))),
              SizedBox(height: 20,),
              Container(
                height: 120,
                width: double.infinity,
                child: Text('$output'),
                decoration: BoxDecoration(border: Border.all(width: .5, color: Colors.black), borderRadius: BorderRadius.circular(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
