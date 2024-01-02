class Contacts {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Contacts({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }

  // mengubah list mapping menjadi list of contacts
  static List<Contacts> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Contacts.fromJson(e)).toList();
  }
}
