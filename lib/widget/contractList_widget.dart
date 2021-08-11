import 'package:flutter/material.dart';

class ContractList extends StatefulWidget {
  const ContractList({Key key}) : super(key: key);

  @override
  _ContractListState createState() => _ContractListState();
}

class _ContractListState extends State<ContractList> {
  bool _hasContract = false;
  var _items=["씽씽","라임","킥고잉"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _kickboardList(),
    );
  }

  Widget _kickboardList(){
    final items=List.generate(_items.length, (i) {
      ListTile(
        title: Text(_items[i]),
        trailing: Icon(Icons.arrow_forward_ios),
      );
    }
    );
      final items2=List.generate(10, (i) {
        ListTile(
          title: Text("hi"),
          trailing: Icon(Icons.arrow_forward_ios),
        );
    });

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
  //    children: <Widget>[items],
    );
  }
}
