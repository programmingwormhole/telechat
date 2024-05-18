class UserModel {
  String? email;
  String? name;
  String? phone;
  String? dateOfBirth;
  String? password;
  String? profilePicture;

  UserModel({
    this.email,
    this.name,
    this.phone,
    this.dateOfBirth,
    this.password,
    this.profilePicture,
  });

  Map<String, dynamic> toRegister () {
    return {
      'name' : name,
      'phone' : phone,
      'password' : password,
      'date_of_birth' : dateOfBirth,
      'email' : email,
      'profile_picture' : profilePicture,
    };
  }

  Map<String, dynamic> toLogin () {
    return {
      'password' : password,
      'email' : email,
    };
  }

}
