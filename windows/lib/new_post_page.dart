import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'publication_page.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _textController = TextEditingController();
  final List<File> _selectedImages = [];
  bool _isNextButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateNextButtonState);
  }

  @override
  void dispose() {
    _textController.removeListener(_updateNextButtonState);
    _textController.dispose();
    super.dispose();
  }

  void _updateNextButtonState() {
    setState(() {
      _isNextButtonEnabled =
          _textController.text.isNotEmpty || _selectedImages.isNotEmpty;
    });
  }

  Future<void> _pickImage() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await _pickImageMobile();
    } else {
      await _pickImageDesktop();
    }
  }

  Future<void> _pickImageMobile() async {
    final picker = ImagePicker();
    List<XFile>? pickedFiles;

    // Request gallery permissions
    var status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
      if (status.isDenied) {
        print('Gallery permission denied');
        return; // Exit if permission is still denied
      }
    }

    try {
      pickedFiles = await picker.pickMultiImage();

      setState(() {
        if (pickedFiles != null) {
          // Add selected images to the list
          for (var file in pickedFiles) {
            _selectedImages.add(File(file.path));
          }
        } else {
          print('No image selected.');
        }
        _updateNextButtonState();
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _pickImageDesktop() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        // Add selected images to the list
        _selectedImages.addAll(files);
        _updateNextButtonState();
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 3 / 7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Новый пост',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _isNextButtonEnabled
                ? () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PublicationPage(
                          selectedImages: _selectedImages,
                          text: _textController.text,
                        ),
                      ),
                    );

                    if (result != null && result.containsKey('publish')) {
                      Navigator.pop(context, result);
                    }
                  }
                : null,
            style: TextButton.styleFrom(
              foregroundColor: _isNextButtonEnabled ? Colors.blue : Colors.grey,
            ),
            child: const Text('Далее'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Напишите что-нибудь...',
                border: InputBorder.none,
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
            ),
            if (_selectedImages.isNotEmpty)
              SizedBox(
                height: imageHeight,
                child: PageView.builder(
                  itemCount: _selectedImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                          _selectedImages[index],
                          width: screenWidth,
                          height: imageHeight,
                          fit: BoxFit.contain,
                        ),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _selectedImages.removeAt(index)),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.7),
                                shape: BoxShape.circle),
                            child: const Icon(Icons.close,
                                size: 16, color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.all(16.0),
          child: IconButton(
              icon: const Icon(Icons.attach_file, color: Colors.black),
              onPressed: _pickImage)),
    );
  }
}
