import 'package:flutter/material.dart';
import 'package:persistant_storage/data/dog_storage.dart';
import 'package:persistant_storage/ui/create_dog.dart';

import '../data/model/dog.dart';

class DogListScreen extends StatefulWidget {
  const DogListScreen({Key? key}) : super(key: key);

  @override
  _DogListScreenState createState() => _DogListScreenState();
}

class _DogListScreenState extends State<DogListScreen> {
  final _dogList = <Dog>[];
  final _dogStorage = DogStorage();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      final dogInDb = await _dogStorage.getAllDog();
      _dogList.clear();
      _dogList.addAll(dogInDb);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _dogList.length,
              itemBuilder: (_, index) {
                final dog = _dogList[index];
                return ListTile(
                  title: Text('${dog.name}'),
                  subtitle: Text('${dog.age}'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) {
                return CreateDog();
              },
            ),
          );

          setState(() {});
        },
        child: Text('Add'),
      ),
    );
  }
}
