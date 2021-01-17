import 'package:flutter/material.dart';
import 'tasks.dart';

class DynamicallyCheckbox extends StatefulWidget {
  @override
  DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
}

class DynamicallyCheckboxState extends State {
  Map<String, bool> List = tasks;
  var allCheck = true;

  checkAllTrue() {
    List.forEach((key, value) {
      if (value == false) {
        allCheck = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (DateTime.now().hour >= 24 && DateTime.now().hour <= 6) {
      List.forEach((key, value) {
        List[key] = false;
      });
    }
    return Column(children: <Widget>[
      /*RaisedButton(
        child: Text(" Get Checked Checkbox Values "),
        onPressed: getItems,
        color: Colors.pink,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),*/
      Expanded(
        child: ListView(
          children: List.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key, style: TextStyle(color: Colors.white)),
              value: List[key],
              activeColor: Colors.deepPurple[400],
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  List[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
