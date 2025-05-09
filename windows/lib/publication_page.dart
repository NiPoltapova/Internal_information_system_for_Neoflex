import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PublicationPage extends StatefulWidget {
  final List<File> selectedImages;
  final String text;

  const PublicationPage(
      {super.key, required this.selectedImages, required this.text});

  @override
  _PublicationPageState createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  final List<PlatformFile> _selectedFiles = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _selectedFiles.addAll(result.files);
      });
    } else {
      // User canceled the picker
      print('No files selected.');
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Публикация',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          if (widget.selectedImages.isNotEmpty)
            SizedBox(
              height: imageHeight,
              child: PageView.builder(
                itemCount: widget.selectedImages.length,
                itemBuilder: (context, index) {
                  return Image.file(
                    widget.selectedImages[index],
                    width: screenWidth,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.text, // Display the text here
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.location_on_outlined, color: Colors.grey),
            title: Text('Место', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          const ListTile(
            leading: Icon(Icons.music_note_outlined, color: Colors.grey),
            title: Text('Музыка', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          const ListTile(
            leading: Icon(Icons.poll_outlined, color: Colors.grey),
            title: Text('Опрос', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
            title: Text('Товары', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          ListTile(
            leading:
                const Icon(Icons.file_present_outlined, color: Colors.grey),
            title: const Text('Файл', style: TextStyle(color: Colors.black)),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            onTap: _pickFiles,
          ),
          ..._selectedFiles
              .map((file) => ListTile(
                    title: Text(file.name,
                        style: const TextStyle(color: Colors.black)),
                    subtitle: Text(
                        '${(file.size / 1024).toStringAsFixed(2)} KB',
                        style: const TextStyle(color: Colors.grey)),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          _selectedFiles.remove(file);
                        });
                      },
                    ),
                  ))
              ,
          const ListTile(
            title: Text('Когда опубликовать',
                style: TextStyle(color: Colors.black)),
            subtitle: Text('Сейчас', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          const ListTile(
            title: Text('Кто увидит этот пост',
                style: TextStyle(color: Colors.black)),
            subtitle: Text('Все', style: TextStyle(color: Colors.grey)),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context, {
                'selectedImages': widget.selectedImages,
                'text': widget.text,
                'selectedFiles': _selectedFiles,
                'publish': true, // Signal to go back to NewsFeedPage
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('Опубликовать'),
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class PublicationPage extends StatefulWidget {
//   final List<File> selectedImages;
//   final String text;

//   const PublicationPage(
//       {Key? key, required this.selectedImages, required this.text})
//       : super(key: key);

//   @override
//   _PublicationPageState createState() => _PublicationPageState();
// }

// class _PublicationPageState extends State<PublicationPage> {
//   List<PlatformFile> _selectedFiles = [];

//   Future<void> _pickFiles() async {
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(allowMultiple: true);

//     if (result != null) {
//       setState(() {
//         _selectedFiles.addAll(result.files);
//       });
//     } else {
//       // User canceled the picker
//       print('No files selected.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final imageHeight = screenWidth * 3 / 7;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'Публикация',
//           style: TextStyle(color: Colors.black, fontSize: 18),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           if (widget.selectedImages.isNotEmpty)
//             Container(
//               height: imageHeight,
//               child: PageView.builder(
//                 itemCount: widget.selectedImages.length,
//                 itemBuilder: (context, index) {
//                   return Image.file(
//                     widget.selectedImages[index],
//                     width: screenWidth,
//                     height: imageHeight,
//                     fit: BoxFit.contain,
//                   );
//                 },
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               widget.text, // Display the text here
//               style: const TextStyle(fontSize: 16),
//             ),
//           ),
//           const ListTile(
//             leading: Icon(Icons.location_on_outlined, color: Colors.grey),
//             title: Text('Место', style: TextStyle(color: Colors.black)),
//             trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ),
//           const ListTile(
//             leading: Icon(Icons.music_note_outlined, color: Colors.grey),
//             title: Text('Музыка', style: TextStyle(color: Colors.black)),
//             trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ),
//           const ListTile(
//             leading: Icon(Icons.poll_outlined, color: Colors.grey),
//             title: Text('Опрос', style: TextStyle(color: Colors.black)),
//             trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ),
//           const ListTile(
//             leading: Icon(Icons.shopping_bag_outlined, color: Colors.grey),
//             title: Text('Товары', style: TextStyle(color: Colors.black)),
//             trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ),
//           ListTile(
//             leading:
//                 const Icon(Icons.file_present_outlined, color: Colors.grey),
//             title: const Text('Файл', style: TextStyle(color: Colors.black)),
//             trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
//             onTap: _pickFiles,
//           ),
//           ..._selectedFiles
//               .map((file) => ListTile(
//                     title: Text(file.name,
//                         style: const TextStyle(color: Colors.black)),
//                     subtitle: Text(
//                         '${(file.size / 1024).toStringAsFixed(2)} KB',
//                         style: const TextStyle(color: Colors.grey)),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.close, color: Colors.grey),
//                       onPressed: () {
//                         setState(() {
//                           _selectedFiles.remove(file);
//                         });
//                       },
//                     ),
//                   ))
//               .toList(),
//           const ListTile(
//             title: Text('Когда опубликовать',
//                 style: TextStyle(color: Colors.black)),
//             subtitle: Text('Сейчас', style: TextStyle(color: Colors.grey)),
//             trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ),
//           const ListTile(
//             title: Text('Кто увидит этот пост',
//                 style: TextStyle(color: Colors.black)),
//             subtitle: Text('Все', style: TextStyle(color: Colors.grey)),
//             trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ),
//         ],
//       ),
//       bottomSheet: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context, {
//                 'selectedImages': widget.selectedImages,
//                 'text': widget.text,
//                 'selectedFiles': _selectedFiles,
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               foregroundColor: Colors.white,
//             ),
//             child: const Text('Опубликовать'),
//           ),
//         ),
//       ),
//     );
//   }
// }
