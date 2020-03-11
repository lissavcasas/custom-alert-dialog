import 'package:flutter/material.dart';

class CustomAlertPage extends StatefulWidget {
  CustomAlertPage({Key key}) : super(key: key);

  @override
  _CustomAlertPageState createState() => _CustomAlertPageState();
}

class _CustomAlertPageState extends State<CustomAlertPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: getTitleDialog(),
      content: getBodyDialog(),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget getTitleDialog() {
    return Text(
      '¿Cómo estuvo la atención?',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget getBodyDialog() {
    return Container(
      width: 300,
      height: 260, //_visible ? 260 : 160,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              goodRate(),
              badRate(),
            ],
          ),
          getCommentary(),
          sendCommentaryBtn(),
        ],
      ),
    );
  }

  Widget goodRate() {
    return Container(
      child: Container(
        width: 100.0,
        height: 100.0,
        child: InkWell(
          customBorder: new CircleBorder(),
          onTap: () {
            print('good');
          },
          splashColor: Colors.green[200],
          child: new Icon(
            Icons.thumb_up,
            size: 50,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget badRate() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: InkWell(
        customBorder: new CircleBorder(),
          onTap: () {
          print('bad');
        },
        splashColor: Colors.red[200],
        child: Icon(
          Icons.thumb_down,
          size: 50,
          color: Color(0xFFD40C16),
        ),
      ),
    );
  }

  Widget getCommentary() {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
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
    );
  }

  Widget sendCommentaryBtn() {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: Text('Enviar'),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 1,
            color: Color(0xFFD40C16),
            textColor: Colors.white,
            onPressed: () {}),
      ),
    );
  }
}
