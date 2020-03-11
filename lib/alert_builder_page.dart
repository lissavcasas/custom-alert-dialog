import 'package:flutter/material.dart';

class AlertBuilderPage extends StatefulWidget {
  const AlertBuilderPage({Key key}) : super(key: key);

  @override
  _AlertBuilderPageState createState() => _AlertBuilderPageState();
}

class _AlertBuilderPageState extends State<AlertBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Open Dialog'),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                Color _iconColorUp = Colors.grey;
                Color _iconColorDown = Colors.grey;
                bool _visible = false;

                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: getTitleDialog(),
                      content: Container(
                        width: 300,
                        height: _visible ? 190 : 100,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //GOOD RATE
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: IconButton(
                                    alignment: Alignment.center,
                                    icon: new Icon(
                                      Icons.thumb_down,
                                      size: 50,
                                      color: _iconColorDown,
                                    ),
                                    onPressed: () => setState(
                                      () {
                                        _visible = true;
                                        _iconColorDown = Colors.red;
                                      },
                                    ),
                                  ),
                                ),
                                //BAD RATE
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  child: IconButton(
                                    alignment: Alignment.center,
                                    icon: new Icon(
                                      Icons.thumb_up,
                                      size: 50,
                                      color: _iconColorUp,
                                    ),
                                    onPressed: () => setState(
                                      () {
                                        _iconColorUp = Colors.green;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _visible ? getCommentary() : Container(),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        cancelBtn(context),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              // contentText = "Changed Content of Dialog";
                            });
                          },
                          child: Text("Enviar"),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget getTitleDialog() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        '¿Cómo estuvo la atención?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget cancelBtn(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.pop(context),
      child: Text("Cancelar"),
    );
  }

  Widget getCommentary() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            autofocus: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10.0),
              helperText: "Cuéntanos qué pasó",
            ),
            textAlign: TextAlign.left,
            onChanged: (value) {
              print(value); // es lo que escribe el usuario
            },
          ),
        ],
      ),
    );
  }
}
