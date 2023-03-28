
class UserModel {
  final String name;
  final String email;
  final String password;
  final String universityId;
  final String phoneNumber;
  final String profilePic;
  final String level;

  UserModel(this.name, this.email, this.password, this.universityId, this.phoneNumber,this.profilePic,this.level);


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'universityId': universityId,
      'phoneNumber': phoneNumber,
      'profilePic':profilePic,
      'level':level
    };
  }

  factory UserModel.fromJosn(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['universityId'] ?? '',
      map['phoneNumber'] ?? '',
      map['profilePic']??'',
      map['level']??'',
    );
  }

}
