import 'package:flutter/material.dart';
import 'package:ssv_carpooling/drawer.dart';
import 'package:ssv_carpooling/pooling.dart';

class TicketBought extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Container(
            height: MediaQuery.of(context).size.height - 20.0,
            width: MediaQuery.of(context).size.width - 20.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Danke fur \nDeine Bestellung",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "1 Stehplatz Vollzahler",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "Hans-Jakob-Tribune",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "23.04.2019 13:30h",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage("assets/ssvjahn.png"),
                            width: MediaQuery.of(context).size.width / 2 - 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            "SSV Jahn",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24.0, 
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage("assets/cologne.png"),
                            width: MediaQuery.of(context).size.width / 2 - 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            "1. FC Koln",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24.0, 
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlineButton(
                      child: Text(
                        "Ticket anzeigen",
                        style: TextStyle(fontSize: 22.0),
                      ),
                      padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                      onPressed: () => {},
                      borderSide: BorderSide(width: 1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mit der Jahn-Familie zum Stadion:",
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            child: _options("assets/finden.png", "Jetzt Heimisiegtrip finden"),
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PoolingPage(title: "SSV Pooling"))),
                          ),
                          _options("assets/anbieten.png", "Jetzt Heimisiegtrip anbieten"),
                          _options("assets/bike.png", "Mit dem Heimsiekorso fahren"),
                          _options("assets/train.png", "Jetzt Heimsiegexpress fahren"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _options(String image, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image(
            image: AssetImage(image),
            width: 45.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.red,
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
