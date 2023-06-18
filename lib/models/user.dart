class UserData {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String uid;
  final String profileImage;

  UserData(
      {required this.name,
      required this.email,
      required this.address,
      required this.uid,
      required this.phone,
      required this.profileImage});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'uid': uid,
      'profileImage': profileImage,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      uid: map['uid'] as String,
      profileImage: map['profileImage'] as String,
    );
  }
}
