import 'package:get/get.dart';

import '../models/contacts_model.dart';

class ContactsProvider extends GetConnect {
  // single user
  Future<Contacts?> getContact(int id) async {
    final response = await get('https://reqres.in/api/users/$id');
    //mengambil map data saja, support tidak perlu, karena sudah dynamic, sudah bisa diakses
    return Contacts.fromJson(response.body["data"]);
  }

  // multi user
  Future<List<Contacts>> getAllContacts() async {
    final response = await get('https://reqres.in/api/users');
    return Contacts.fromJsonList(response.body["data"]);
  }
}
