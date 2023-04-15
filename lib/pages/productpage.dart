import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');

  void _createProduct() async {
    try {
      await _productsCollection.add({
        'name': _nameController.text,
        'description': _descriptionController.text,
        'price': int.parse(_priceController.text),
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void _updateProduct(DocumentSnapshot doc) async {
    try {
      await _productsCollection.doc(doc.id).update({
        'name': _nameController.text,
        'description': _descriptionController.text,
        'price': int.parse(_priceController.text),
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void _deleteProduct(DocumentSnapshot doc) async {
    try {
      await _productsCollection.doc(doc.id).delete();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _productsCollection.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot doc = docs[index];
              return ListTile(
                title: Text(doc['name']),
                subtitle: Text(doc['description']),
                trailing: Text('${doc['price']}'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      _nameController.text = doc['name'];
                      _descriptionController.text = doc['description'];
                      _priceController.text = doc['price'].toString();

                      return AlertDialog(
                        title: const Text('Edit Product'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration:
                                  const InputDecoration(labelText: 'Name'),
                            ),
                            TextField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                  labelText: 'Description'),
                            ),
                            TextField(
                              controller: _priceController,
                              decoration:
                                  const InputDecoration(labelText: 'Price'),
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _updateProduct(doc);
                              Navigator.pop(context);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
                onLongPress: () => _deleteProduct(doc),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              _nameController.clear();
              _descriptionController.clear();
              _priceController.clear();

              return AlertDialog(
                title: const Text('New Product'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                    TextField(
                      controller: _priceController,
                      decoration: const InputDecoration(labelText: 'Price'),
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _createProduct();
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
