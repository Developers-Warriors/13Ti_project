
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantController = TextEditingController();

  List<Map<String, dynamic>> items = [];

  final shopBox = Hive.box('shop_box');

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() {
    final date = shopBox.keys.map((key) {
      final item = shopBox.get(key);
      return {
        "key": key,
        "name": item['name'],
        "quant": item['quant'],
      };
    }).toList();
    setState(() {
      items = date.reversed.toList();
      print('количисво сох ${items.length}');
    });
  }

  // Create new item
  Future<void> createItem(Map<String, dynamic> newItem) async {
    await shopBox.add(newItem);
    refresh();
  }

  Future<void> upDateItem(int itemKey, Map<String, dynamic> item) async {
    await shopBox.put(itemKey, item);
    refresh();
  }

  Future<void> delete(int itemKey) async {
    await shopBox.delete(itemKey);
    refresh();

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(S.of(context).text_delete)));
  }

  void _showButtomSheet(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final existingItem =
          items.firstWhere((element) => element['key'] == itemKey);
      nameController.text = existingItem['name'];
      quantController.text = existingItem['quant'];
    }
    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  left: 15,
                  top: 15,
                  right: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextField(
                      controller: quantController,
                      decoration: const InputDecoration(hintText: 'Name'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: 'Number'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          if (itemKey == null) {
                            createItem({
                              'name': nameController.text,
                              'quant': quantController.text
                            });
                          }
                          if (itemKey != null) {
                            upDateItem(itemKey, {
                              'name': nameController.text.trim(),
                              'quant': quantController.text.trim(),
                            });
                          }

                          nameController.text = '';
                          quantController.text = '';
                          Navigator.of(context).pop();
                        },
                        child: Text(itemKey == null ? 'Cteate New' : 'upDate')),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          S.of(context).title_hiveTest,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) {
                final currentItem = items[index];
                return Card(
                  color: Colors.purpleAccent,
                  elevation: 3,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      currentItem['name'],
                    ),
                    subtitle: Text(
                      currentItem['quant'].toString(),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () =>
                                _showButtomSheet(context, currentItem['key']),
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () => delete(currentItem['key']),
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showButtomSheet(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
