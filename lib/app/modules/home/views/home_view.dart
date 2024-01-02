import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../data/models/contacts_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        //future builder untuk fetch data
        body: FutureBuilder<List<Contacts>>(
          future: controller.getAllContacts(),
          ///Snapshot=snap, which is an AsyncSnapshot, holds the most recent interaction with the future, including data, error, and the state of the connection.
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snap.data!.isEmpty) {
              return const Center(child: Text("Data tidak ditemukan"));
            } else {
              return ListView.builder(
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index) {
                    Contacts contact = snap.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(contact.avatar!),
                      ),
                      title: Text("${contact.firstName} ${contact.lastName}"),
                      subtitle: Text(contact.email!),
                    );


                  });
            }
          },
        ));
  }
}
