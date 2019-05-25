import 'package:flutter/material.dart';
import 'package:ssv_carpooling/drawer.dart';

class ScoreboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoreboard"),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("assets/tim.png"),
                  minRadius: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: Text(
                    "Tim",
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.w900),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "23",
                  style: TextStyle(fontSize: 52.0, fontWeight: FontWeight.w900),
                ),
                Text(
                  "X",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                ),
                Image.asset(
                  "assets/jahni_is_the_key.png",
                  height: 60.0,
                ),
                Container(
                  height: 60.0,
                  width: 1.0,
                  color: Colors.black,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Text(
                  "#7",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 52.0,
                      fontWeight: FontWeight.w900),
                )
              ],
            ),
            divider(context),
            listItem(context, "Heimisiegtrips", "11", "#16"),
            divider(context),
            listItem(context, "Heimisiegkorsos", "2", "#45"),
            divider(context),
            listItem(context, "Heimisiegexpress", "0", "#85"),
            divider(context),
            listItem(context, "Heimspiele", "13", "#05"),
            divider(context),
            listItem(context, "Auswartsspiele", "8", "#23"),
            divider(context),
            listItem(context, "Stadien besucht", "9", "#25"),
          ],
        ),
      ),
    );
  }

  Row divider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 1.0,
          width: MediaQuery.of(context).size.width - 40,
          color: Colors.black,
        ),
      ],
    );
  }

  Row listItem(
      BuildContext context, String content, String points, String position) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          content,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Text(
                points,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.black,
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              ),
              Text(
                position,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
