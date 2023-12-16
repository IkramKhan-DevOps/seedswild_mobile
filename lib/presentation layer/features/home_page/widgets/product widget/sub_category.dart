import 'package:flutter/material.dart';

class GridListDemo extends StatelessWidget {
  const GridListDemo({Key? key}) : super(key: key);

  static String imagePath = '$imagePath';
  @override
  Widget build(BuildContext context) {
    List<ImageData> imageDataList = [
      ImageData(
        imagePath: "$imagePath/img_unsplash8hqpxttomn0_171x142.png",
        name: "Image 1",
      ),
      ImageData(
        imagePath: "$imagePath/assets/images/img_unsplashjj0tls2rod4_58x58.png",
        name: "Image 2",
      ),
      ImageData(
        imagePath:
            "$imagePath/assets/images/img_unsplashqnuur0o5x8_58x58_1.png",
        name: "Image 4",
      ),
      ImageData(
        imagePath:
            "$imagePath/assets/images/img_unsplashw7b3edub2i_299x299.png",
        name: "Image 5",
      ),
      ImageData(
        imagePath: "$imagePath/assets/images/img_unsplashjj0tls2rod4_58x58.png",
        name: "Image 6",
      ),
      ImageData(
        imagePath: "$imagePath/img_unsplash8hqpxttomn0_171x142.png",
        name: "Image 7",
      ),
      ImageData(
        imagePath:
            "$imagePath/assets/images/img_unsplashqnuur0o5x8_58x58_1.png",
        name: "Image 8",
      ),
      ImageData(
        imagePath: "$imagePath/assets/images/img_unsplashjj0tls2rod4_58x58.png",
        name: "Image 2",
      ),
      ImageData(
        imagePath:
            "$imagePath/assets/images/img_unsplashqnuur0o5x8_58x58_1.png",
        name: "Image 4",
      ),
      ImageData(
        imagePath:
            "$imagePath/assets/images/img_unsplashw7b3edub2i_299x299.png",
        name: "Image 5",
      ),
      ImageData(
        imagePath: "$imagePath/assets/images/img_unsplashjj0tls2rod4_58x58.png",
        name: "Image 6",
      ),

      // add more images here...
    ];

    // Build the widget tree with a Scaffold and a GridView
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(12.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
        ),
        children: imageDataList.map((imageData) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(imageData.imagePath),
                const SizedBox(height: 8.0),
                Text(imageData.name),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Define a data class for the image data
class ImageData {
  final String imagePath;
  final String name;

  // Constructor for the class
  ImageData({
    required this.imagePath,
    required this.name,
  });
}
