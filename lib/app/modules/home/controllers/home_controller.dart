import 'package:contacts/app/data/models/contacts_model.dart';
import 'package:get/get.dart';
import '../../../data/providers/contacts_provider.dart';
//connect view dengan model melalui controller
class HomeController extends GetxController {
  ContactsProvider contactsProvider = ContactsProvider();

  Future<Contacts?> getSingleContact(int id) async {
   return await contactsProvider.getContact(id);
  }
  Future<List<Contacts>> getAllContacts() async {
    return await contactsProvider.getAllContacts();
  }
}
