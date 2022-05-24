import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../providers/great_place.dart';
import '../widgets/location_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = 'addPlaceScreen';
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();
  File? _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlace>(context, listen: false)
        .addPlace(titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add place'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        label: Text('Enter Title'),
                      ),
                      controller: titleController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ImageInput(selectImage),
                   const SizedBox(height: 10.0,),
                   const LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed:_savePlace,
            color: Theme.of(context).primaryColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add),
                Text('Add Place'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
