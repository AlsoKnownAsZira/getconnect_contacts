import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../data/models/contacts_model.dart';

class SecondPage extends GetView<HomeController> {
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SecondPage'),
          centerTitle: true,
        ),
        body: FutureBuilder<Contacts?>(
          future: controller.getSingleContact(2),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.data == null) {
              return const Center(child: Text("Data tidak ditemukan"));
            } else {
              Contacts contact = snap.data!;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(contact.avatar!),
                ),
                title: Text("${contact.firstName} ${contact.lastName}"),
                subtitle: Text(contact.email!),
              );
            }
          },
        ),
    );
  }
}