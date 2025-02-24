import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:unboundbible/locator.dart';
import 'package:unboundbible/stores/search_store.dart';

// import 'package:flutter/material.dart' show SearchBar;

class SearchPage extends StatelessWidget {
  final store = locator<SearchStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: _searchBar(context),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            color: Colors.white,
            child: _listView(context),
          ),
        );
      },
    );
  }

  Widget _searchBar(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: Colors.grey,
        onSubmitted: (value) => store.update(value),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search_rounded),
          ),
        ),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    final lines = store.content;
    return ListView.builder(
      key: ObjectKey(lines.hashCode),
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text(line, style: TextStyle(fontSize: 24.0)),
            onTap: () {},
          ),
        );
      },
    );
  }
}
