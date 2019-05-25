import 'package:flutter/material.dart';
import 'package:ssv_carpooling/main.dart';
import 'package:ssv_carpooling/pooling.dart';
import 'package:ssv_carpooling/scoreboard.dart';
import 'package:ssv_carpooling/ticket.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 5.0,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Tim Koster"),
              accountEmail: Text("5726312"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/tim.png"),
              ),
            ),
            ListTile(
              title: Text("Matchday information"),
              trailing: Icon(Icons.calendar_today, size: 30.0),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TicketBought())),
              ),
            ListTile(
              title: Text("SSV Carpooling"),
              trailing: Icon(Icons.directions_car, size: 30.0),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PoolingPage(title: "SSV Carpooling"))),
            ),
            ListTile(
              title: Text("My tickets"),
              trailing: Icon(Icons.bookmark_border, size: 30.0),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TicketBought())),
            ),
            ListTile(
              title: Text("Membership"),
              trailing: Icon(Icons.supervised_user_circle, size: 30.0),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TicketBought())),
            ),
            ListTile(
              title: Text("Scoreboard"),
              trailing: Icon(Icons.stars, size: 30.0),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ScoreboardPage())),
            )
          ],
        ),
      );
  }

}