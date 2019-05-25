import 'package:flutter/material.dart';

class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Stack(
              children: <Widget>[
                Positioned(
                  left: 45,
                  top: 100,
                  child: Container(
                    height: 200.0,
                    width: 1.0,
                    color: Colors.red,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                ),
                _createOverviewTile(context,
                  _createPersonTile(
                    context, 
                    "Jakub", 
                    "assets/jakub.png", 
                    true,
                    "Regensburger Str. 36A",
                    "93158 Teublitz",
                    "12:15 Uhr"
                  ),
                  _createPersonTile(
                    context, 
                    "Johanna",
                    "assets/woman.png",
                    false,
                    "Kiefernweg 3",
                    "93128 Regenstauf",
                    "12:30 Uhr"
                  ),
                  _createPersonTile(
                    context,
                    "Tim",
                    "assets/man.png",
                    false,
                    "Hopfenweg 1",
                    "93197 Zeitlarn",
                    "12:40 Uhr"
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Padding _createOverviewTile(BuildContext context, Container person1,
      Container person2, Container person3) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Das ist meine Route:",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              )),
          person1,
          person2,
          person3,
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: OutlineButton(
                onPressed: () => {
                  Navigator.pop(context),
                  _requestSentDialog(context)
                },
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 50.0, right: 50.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                child: Text("Heimsiegtrip anfragen",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _createPersonTile(
      BuildContext context, String name, String photo, bool driver, String address, String zip, String time) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 24.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(photo),
                      minRadius: 40.0,
                    ),
                    driver
                        ? Positioned(
                            bottom: -2.0,
                            right: -2.0,
                            child: Image(
                              image: AssetImage("assets/steering.png"),
                              width: 35.0,
                            ),
                          )
                        : Container(width: 0.0, height: 0.0)
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.access_time),
              ),
              Icon(Icons.place),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, top: 16.0, left: 4.0),
                child: Text(time),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(address),
                  Text(zip),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _requestSentDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Anfrage an Jakub gesendet'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Wir haben Jakub Deine Anfrage gesendet. Wir schicken Dir eine Benachrichtigung sobald er die Fahrt akzeptiert hat.'),
            ],
          ),
        ),
        elevation: 5.0,
        actions: <Widget>[
          FlatButton(
            child: Text('Alles klar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}
