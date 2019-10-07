import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SafeArea(child: TranslatePage()),
  ));
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({this.title, this.wordType, this.meaning, this.example});

  final String title;
  final String wordType;
  final String meaning;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _DefinitionCardBox(
            title: title,
            wordType: wordType,
            meaning: meaning,
            example: example,
          ),
        ],
      ),
    );
  }
}

class _DefinitionCardBox extends StatelessWidget {
  const _DefinitionCardBox({
    Key key,
    this.title,
    this.wordType,
    this.meaning,
    this.example,
  }) : super(key: key);

  final String title;
  final String wordType;
  final String meaning;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
        ),
        SizedBox(height: 5),
        Text(
          wordType,
          style: const TextStyle(
              fontSize: 10.0,
              fontStyle: FontStyle.italic,
              color: Colors.black45),
        ),
        SizedBox(height: 10),
        Text(
          meaning,
          style: const TextStyle(fontSize: 15.0),
        ),
        SizedBox(height: 10),
        Text(
          example,
          style: const TextStyle(fontSize: 15.0, color: Colors.black45),
        )
      ],
    );
  }
}

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

Column columnCreator(String name, Icon iconType) {
  return Column(
    children: <Widget>[
      iconType,
      Text('$name', style: TextStyle(fontSize: 10, color: Colors.black)),
    ],
  );
}

Column column1 = columnCreator(
    'camera',
    Icon(
      Icons.camera_alt,
      color: Colors.blueAccent,
    ));
Column column2 = columnCreator(
    'voice',
    Icon(
      Icons.donut_small,
      color: Colors.blueAccent,
    ));
Column column3 = columnCreator(
    'hand writing',
    Icon(
      Icons.airline_seat_recline_extra,
      color: Colors.blueAccent,
    ));
Column column4 = columnCreator(
    'speaking',
    Icon(
      Icons.book,
      color: Colors.blueAccent,
    ));

class _TranslatePageState extends State<TranslatePage> {

  IconData starIconChange = Icons.star_border;
  changeStar(){
    setState(() {
      if(starIconChange == Icons.star_border){
        starIconChange = Icons.star;
      }
      else {
        starIconChange = Icons.star_border;
      }
      return starIconChange;
    });
  }

  String dropDownValue1 = 'Indonesian';
  String dropDownValue2 = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Google Translate'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Material(
                                color: Colors.white,
                                child: DropdownButton<String>(
                                  value: dropDownValue1,
                                  iconSize: 24,
                                  style: TextStyle(color: Colors.blue, fontSize: 20),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropDownValue1 = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Indonesian',
                                    'Telugu',
                                    'Portuguese',
                                    'English'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.compare_arrows,
                                  size: 30,
                                  color: Colors.blue,
                                )),
                            Expanded(
                              flex: 2,
                              child: Material(
                                color: Colors.white,
                                child: DropdownButton<String>(
                                  value: dropDownValue2,
                                  iconSize: 24,
                                  style: TextStyle(color: Colors.blue, fontSize: 20),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropDownValue2 = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Indonesian',
                                    'Telugu',
                                    'Portuguese',
                                    'English'
                                  ].map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 8),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.volume_up,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('INDONESIAN',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),

                                Icon(Icons.cancel),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                                child: Text('good morning',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 30)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Expanded(child: column1),
                        Expanded(child: column2),
                        Expanded(child: column3),
                        Expanded(child: column4),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('INDONESIAN',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            IconButton(
                              icon: Icon(starIconChange,color: Colors.white,),onPressed:
                                changeStar,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                            child: Text('Selamat pagi',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(width: 250),
                          Icon(
                            Icons.content_copy,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: CustomListItem(
                  title: 'DEFINITIONS',
                  wordType: 'exclamation',
                  meaning:
                      'expresses good wishes on meeting or parting during the morning',
                  example:
                      'He walked into Stein\'s lodge on Tuesday morning, bidding good morning to everyone who lined his route to the top table.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
