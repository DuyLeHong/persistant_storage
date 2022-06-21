import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistant_storage/data/dog_storage.dart';
import 'package:persistant_storage/data/model/dog.dart';

class CreateDog extends StatelessWidget {
  CreateDog({Key? key}) : super(key: key);

  final _dogStorage = DogStorage();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text('id:'),
            TextField(
              controller: _idController,
            ),
            Text('name:'),
            TextField(
              controller: _nameController,
            ),
            Text('age:'),
            TextField(
              controller: _ageController,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                final id = int.parse(_idController.text);
                final age = int.parse(_ageController.text);
                final dog = Dog(id: id, name: _nameController.text, age: age);
                _dogStorage.insertDog(dog);
                Navigator.of(context).pop();
              },
              child: Text('Insert dog'),
            )
          ],
        ),
      ),
    );
  }
}
