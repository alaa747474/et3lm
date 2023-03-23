
class UserModel {
  final String name;
  final String email;
  final String password;
  final String universityId;
  final String phoneNumber;
  final String profilePic;

  UserModel(this.name, this.email, this.password, this.universityId, this.phoneNumber,this.profilePic);


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'universityId': universityId,
      'phoneNumber': phoneNumber,
      'profilePic':profilePic
    };
  }

  factory UserModel.fromJosn(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['universityId'] ?? '',
      map['phoneNumber'] ?? '',
      map['profilePic']
    );
  }

}
