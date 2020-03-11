import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _iconColorUp = Colors.grey;
  Color _iconColorDown = Colors.grey;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: getTitleDialog(),
      content: getBodyDialog(),
      actions: [sendBtn],
    );
  }

  Widget sendBtn = SizedBox(
    //width: double.infinity,
    child: RaisedButton(
        child: Container(
          child: Text('Enviar'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 1,
        color: Color(0xFFD40C16),
        textColor: Colors.white,
        onPressed: () {}),
  );

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

  Widget getBodyDialog() {
    return Container(
      width: 300,
      height: _visible ? 190 : 100,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              badRate(),
              goodRate(),
            ],
          ),
          _visible ? getCommentary() : Container(),
        ],
      ),
    );
  }

  Widget badRate() {
    return Container(
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
    );
  }

  Widget goodRate() {
    return Container(
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
