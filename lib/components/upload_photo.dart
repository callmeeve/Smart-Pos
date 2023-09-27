import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpos/theme.dart';
import 'package:unicons/unicons.dart';

class ImageUploadForm extends StatefulWidget {
  const ImageUploadForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageUploadFormState createState() => _ImageUploadFormState();
}

class _ImageUploadFormState extends State<ImageUploadForm> {
  // File image = File(""); // Initialize with an empty file object

  // Future<void> _pickImage() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'jpeg', 'png'],
  //   );

  //   if (result != null) {
  //     PlatformFile platformFile = result.files.first;
  //     setState(() {
  //       image = File(platformFile.path!); // Update the value of "image"
  //     });
  //   }
  // }

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['png', 'jpg', 'jpeg']);

    if (file != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // if (image.path.isNotEmpty) // Check if the path is not empty
        //   Image.file(image),
        GestureDetector(
          onTap: selectFile,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(10),
                dashPattern: [10, 4],
                strokeCap: StrokeCap.round,
                color: primaryBlue,
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50.withOpacity(.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        UniconsLine.folder_upload,
                        color: primaryBlue,
                        size: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Select your file',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
