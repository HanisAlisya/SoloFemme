import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SelfieUploadScreen extends StatefulWidget {
  const SelfieUploadScreen({super.key});

  @override
  State<SelfieUploadScreen> createState() => _SelfieUploadScreenState();
}

class _SelfieUploadScreenState extends State<SelfieUploadScreen> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  void _submit() {
    if (_imageFile != null) {
      // TODO: Upload selfie to Firebase Storage
      // TODO: Set user status to "pending" in Firestore
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selfie submitted for verification')),
      );
      // Navigate to waiting screen or logout
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please take a selfie to proceed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selfie Verification")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Please take a clear selfie for verification. Your photo will be reviewed by the admin and deleted afterward.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _imageFile != null
                ? Image.file(_imageFile!, height: 250)
                : const Placeholder(
                fallbackHeight: 250, fallbackWidth: double.infinity),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Take Selfie"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
