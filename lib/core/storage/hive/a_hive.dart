import 'package:hive/hive.dart';

class AHive {

  final shopBox = Hive.box('box');

  Future<void> createItemList(String token) async {
    await shopBox.add(token);
  }
}
