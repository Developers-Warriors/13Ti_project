import 'package:flutter/material.dart';

import '../../core/storage/storage.dart';

class SecuteStoragePage extends StatefulWidget {
  const SecuteStoragePage({super.key});

  @override
  State<SecuteStoragePage> createState() => _SecuteStoragePageState();
}

class _SecuteStoragePageState extends State<SecuteStoragePage> {
  late TextEditingController textEditingController;
  var varString;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    // getStrings();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // Future getStrings() async {
  //   var srt = await SecureStorage().getString();
  //   setState(() {
  //     varString = srt;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                controller: textEditingController,
                decoration:
                    const InputDecoration(border: OutlineInputBorder())),
          ),
          // ElevatedButton(
          //     onPressed: () => SecureStorage()
          //         .writeSecureData('name', textEditingController.text),
          //     child: const Text('Save')),
          const SizedBox(height: 15),
          // ElevatedButton(
          // onPressed: () => SecureStorage().readSecureData('name'),
          // child: const Text('read')),
          ElevatedButton(
              onPressed: () =>
                  SecureStorage().writeAccessToken(textEditingController.text),
              child: const Text('writeAccess')),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => SecureStorage().readAccesToken(),
              child: const Text('readAccess')),
          const SizedBox(height: 15),

          ElevatedButton(
              onPressed: () => SecureStorage().writeIsLogin(true),
              child: const Text('writeTrue')),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => SecureStorage().writeIsLogin(false),
              child: const Text('writeFalse')),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => SecureStorage().readIsLogin(),
              child: const Text('readIsLogin')),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
