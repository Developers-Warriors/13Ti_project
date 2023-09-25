import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FilePDF extends StatefulWidget {
  const FilePDF({super.key});

  @override
  State<FilePDF> createState() => _FilePDFState();
}

class _FilePDFState extends State<FilePDF> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> pdfData = [];

  Future<String> uploanPDF(String fileName, File file) async {
    final reference = FirebaseStorage.instance.ref('pdfs/$fileName.pdf');
    final uploanTask = reference.putFile(file);

    await uploanTask.whenComplete(() {});
    final dowloanLink = await reference.getDownloadURL();
    return dowloanLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'png'],
    );
    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
      final downloanLick = await uploanPDF(fileName, file);

      await _firebaseFirestore.collection("pdfs").add({
        "name": fileName,
        "url": downloanLick,
      });
      print('PDF Success');
    }
  }

  void getPDFdownload() async {
    final result = await _firebaseFirestore.collection('pdfs').get();

    pdfData = result.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  // @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    getPDFdownload();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),            
            itemCount: pdfData.length,
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return pdfData.isEmpty
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PDFViewerScreens(
                                urlPdf: pdfData[index]['url'],
                              ),
                            ));
                      },
                      child: Card(
                        child: Center(
                          child: Text(pdfData[index]['name']),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.picture_as_pdf_outlined),
        onPressed: pickFile,
      ),
    );
  }
}

class PDFViewerScreens extends StatefulWidget {
  const PDFViewerScreens({super.key, required this.urlPdf});
  final String urlPdf;
  @override
  State<PDFViewerScreens> createState() => _PDFViewerScreensState();
}

class _PDFViewerScreensState extends State<PDFViewerScreens> {
  PDFDocument? document;

  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.urlPdf);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: document != null
            ? PDFViewer(document: document!, showPicker: false)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
