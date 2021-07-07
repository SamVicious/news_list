import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_list/control/dataBaseHelper.dart';

class ContentPage extends StatefulWidget {
  final Map<String, dynamic> individualContent;
  ContentPage(this.individualContent);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  var isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.individualContent['title']),
      ),
      body: Container(
        child: Column(
          children: [
            Image(
              image: NetworkImage(widget.individualContent['urlToImage'] ??
                  'https://www.wpkube.com/wp-content/uploads/2018/10/404-page-guide-wpk.jpg'),
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.individualContent['description'],
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
          color: isPressed ? Colors.red[300] : Colors.white,
        ),
        backgroundColor: Colors.grey,
        onPressed: () => setState(() async {
          isPressed = !isPressed;
          await DatabaseHelper.instance.insert({
            DatabaseHelper.columnName: widget.individualContent['title']
          }); // Adds title to database
        }),
      ),
    );
  }
}