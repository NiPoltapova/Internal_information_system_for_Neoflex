import 'package:flutter/material.dart';

class HorizontalImageSlider extends StatelessWidget {
  final List<String> imageUrls;

  const HorizontalImageSlider({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        final url = imageUrls[index];
        if (url.startsWith('http')) {
          return Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              );
            },
          );
        } else {
          return Image.asset(
            url,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image)),
              );
            },
          );
        }
      },
    );
  }
}


// class HorizontalImageSlider extends StatefulWidget {
//   final List<String> imageUrls;

//   const HorizontalImageSlider({super.key, required this.imageUrls});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HorizontalImageSliderState createState() => _HorizontalImageSliderState();
// }

// class _HorizontalImageSliderState extends State<HorizontalImageSlider> {
//   final PageController _pageController = PageController(initialPage: 0);
//   int _currentPage = 0;

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Get screen width
//     final screenWidth = MediaQuery.of(context).size.width;
//     // Calculate desired height based on 2:1 aspect ratio
//     final imageHeight = screenWidth / 2;

//     return Column(
//       children: [
//         Expanded(
//           child: PageView.builder(
//             controller: _pageController,
//             itemCount: widget.imageUrls.length,
//             onPageChanged: (int page) {
//               setState(() {
//                 _currentPage = page;
//               });
//             },
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   width: screenWidth,
//                   height: imageHeight,
//                   child: Image.asset(
//                     widget.imageUrls[index],
//                     fit: BoxFit.contain, // Changed from cover to contain
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: _buildPageIndicator(),
//         ),
//       ],
//     );
//   }

//   List<Widget> _buildPageIndicator() {
//     List<Widget> list = [];
//     for (int i = 0; i < widget.imageUrls.length; i++) {
//       list.add(i == _currentPage ? _indicator(true) : _indicator(false));
//     }
//     return list;
//   }

//   Widget _indicator(bool isActive) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 150),
//       margin: const EdgeInsets.symmetric(horizontal: 4.0),
//       height: 8.0,
//       width: isActive ? 24.0 : 8.0,
//       decoration: BoxDecoration(
//         color: isActive ? Colors.blue : Colors.grey,
//         borderRadius: const BorderRadius.all(Radius.circular(12)),
//       ),
//     );
//   }
// }