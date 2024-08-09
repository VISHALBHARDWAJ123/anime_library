import 'package:anime_library/utils/app_export.dart';
import 'dart:io';
import 'package:image/image.dart' as img;

Future<String> returnSvgString({required String imageUrl}) async {
  final response = await get(Uri.parse(imageUrl));
  return response.body;
}

Future<Uint8List> convertImageToPng(Uint8List imageBytes, {int? width, int? height}) async {
  final image = img.decodeImage(imageBytes);
  final resizedImage = img.copyResize(image!, width: width ?? 200, height: height ?? 200);
  return Uint8List.fromList(img.encodePng(resizedImage));
}

Future<File> returnPngFile({required Uint8List imageBytes, required String imageType}) async {
  final pngBytes = await convertImageToPng(
    imageBytes,
  );

  // Get the path to the application's documents directory.
  final directory = await getApplicationDocumentsDirectory();

  // Create a file in the documents directory.
  final file = File('${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.png');

  // Write the PNG bytes to the file and return it.
  return await file.writeAsBytes(pngBytes);
}

Future<Color> returnDominantColor({required String imageUrl, required VoidCallback callback}) async {
  final response = await HttpClient().getUrl(Uri.parse(imageUrl));
  final responseBody = await response.close();
  final imageBytes = await consolidateHttpClientResponseBytes(responseBody);

  String imageType = imageUrl.split('?').first.split('.').last.toLowerCase();

  if (['jpg', 'jpeg', 'png', 'gif'].contains(imageType)) {
    imageType = 'bitmap';
  } else {
    throw UnsupportedError('Unsupported image format');
  }

  final file = await returnPngFile(imageBytes: imageBytes, imageType: imageType);

  final paletteGenerator = await PaletteGenerator.fromImageProvider(
    FileImage(file),
  );

  callback();
  return paletteGenerator.dominantColor != null ? paletteGenerator.dominantColor!.color : Colors.white;
}

/*----------------Widgets----------------*/
Widget verticalSpace({required double spaceValue}) => SizedBox(
      height: Adaptive.h(spaceValue),
    );

SliverAppBar homeScreenAppBar() => SliverAppBar(
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: Adaptive.h(8),
      leading: const SizedBox(),
      flexibleSpace: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/appBar_logo.png',
                  height: 40,
                  width: 40,
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Poké',
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: .5,
                          fontSize: Adaptive.sp(
                            22,
                          ),
                          fontFamily: 'Sofia Sans Condensed Regular',
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Library',
                          style: TextStyle(
                              fontSize: Adaptive.sp(
                                22,
                              ),
                              fontFamily: 'Sofia Sans Condensed Regular',
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );

LottieBuilder loadingBar({double? width, double? height}) => Lottie.asset(
      'assets/loading.json',
      width: width ?? Adaptive.w(20),
      height: height ?? Adaptive.w(20),
      repeat: true,
      renderCache: RenderCache.drawingCommands,
    );

/*----------------Extra Functions----------------*/
void removeFocus({required BuildContext context}) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  currentFocus.unfocus();
}

String capitalize(String text) {
  return text.split(' ').map((word) {
    if (word.isNotEmpty) {
      return word[0].toUpperCase() + word.substring(1);
    }
    return '';
  }).join(' ');
}

/*---------------Text Styles----------------------*/
TextStyle hintStyle() => TextStyle(
    fontSize: Adaptive.sp(
      20,
    ),
    fontFamily: 'Sofia Sans Condensed Regular',
    fontWeight: FontWeight.normal,
    color: hintColor);

/*--------------Navigation Function---------------*/

void goToScreen({required String routeName, String? data = '', required BuildContext context}) {
  context.push(
    routeName + (data ?? ''),
  );
}

void goBack({required BuildContext context}) {
  context.pop();
}

String convertToHtml({
  required String input,
  required String name,
}) {
  // Function to convert a section into HTML

  String convertSection(String section) {
    List<String> lines = section.split('\n');
    StringBuffer html = StringBuffer();

    for (String line in lines) {
      if (line.contains(':')) {
        var parts = line.split(':');
        html.write('<li><strong>${parts[0].trim()}:</strong> ${parts[1].trim()}</li><br>');
      } else if (line.trim().isEmpty) {
        html.write('<br>');
      } else {
        html.write('<p>${line.trim()}</p>');
      }
    }
    return html.toString();
  }

  // Splitting the input into main sections
  List<String> sections = input.split('\n\n');

  StringBuffer html = StringBuffer();

  for (String section in sections) {
    html.write('<div class="section">${convertSection(section)}</div>');
  }

  return generateHtml(name, html.toString());
}

String generateHtml(String name, String content) {
  return '''
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      
      <style>
          body {
              font-family: Arial, sans-serif;
              line-height: 1.6;
              margin: 20px;
              background-color: #f9f9f9;
              color: #333;
          }
          h1, h2, h3 {
              color: #444;
          }
          .section {
              margin-bottom: 20px;
          }
          .section-header {
              font-size: 1.5em;
              margin-bottom: 10px;
          }
          ul {
              list-style-type: disc;
              padding-left: 20px;
          }
          .more-content {
              display: none;
          }
          .view-more {
              color: blue;
              cursor: pointer;
              text-decoration: underline;
          }
      </style>

      <script>
          function toggleContent() {
              var moreContent = document.getElementById("more-content");
              var viewMore = document.getElementById("view-more");

              if (moreContent.style.display === "none") {
                  moreContent.style.display = "inline";
                  viewMore.innerText = "View Less";
              } else {
                  moreContent.style.display = "none";
                  viewMore.innerText = "View More";
              }
          }
      </script>
  </head>
  <body>
      
      <p>$content</p>
      
  </body>
  </html>
  ''';
}

String getBaiscDetails(String input, String name) {
  List<String> sections = input.split('\n\n');

  StringBuffer html = StringBuffer();

  for (String section in sections) {
    html.write('<div class="section">${generateBasicDetails(section)}</div>');
  }
  return generateHtml(name, html.toString());
}

String generateBasicDetails(String section) {
  List<String> lines = section.split('\n');
  StringBuffer html = StringBuffer();

  for (String line in lines) {
    if (line.contains(':')) {
      var parts = line.split(':');
      html.write('<li><strong>${parts[0].trim()}:</strong> ${parts[1].trim()}</li><br>');
    } else if (line.trim().isEmpty) {
      html.write('<br>');
    }
  }
  return html.toString();
}

String getFullDetails(String input) {
  String convertSection(String section) {
    List<String> lines = section.split('\n');
    StringBuffer html = StringBuffer();

    for (String line in lines) {
      if (line.contains(':')) {
        // var parts = line.split(':');
        // html.write('<li><strong>${parts[0].trim()}:</strong> ${parts[1].trim()}</li><br>');
      } else if (line.trim().isEmpty) {
        // html.write('<br>');
      } else {
        html.write(line.trim());
      }
    }
    return html.toString();
  }

  List<String> sections = input.split('\n\n');

  StringBuffer html = StringBuffer();

  for (String section in sections) {
    html.write(convertSection(section));
  }

  return html.toString();
}

const popularAnimeCharacters = [
  "Naruto Uzumaki", // Naruto
  "Sasuke Uchiha", // Naruto
  "Goku", // Dragon Ball Z
  "Vegeta", // Dragon Ball Z
  "Luffy", // One Piece
  "Zoro", // One Piece
  "Ichigo Kurosaki", // Bleach
  "Rukia Kuchiki", // Bleach
  "Edward Elric", // Fullmetal Alchemist
  "Alphonse Elric", // Fullmetal Alchemist
  "Eren Yeager", // Attack on Titan
  "Mikasa Ackerman", // Attack on Titan
  "Levi Ackerman", // Attack on Titan
  "Saitama", // One Punch Man
  "Genos", // One Punch Man
  "Light Yagami", // Death Note

  "Tanjiro Kamado", // Demon Slayer
  "Nezuko Kamado", // Demon Slayer
  "Sakura Haruno", // Naruto
  "Itachi Uchiha", // Naruto
  "Kakashi Hatake", // Naruto
  "Hinata Hyuga", // Naruto
];
