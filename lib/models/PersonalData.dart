enum Sex { Male, Female }
Map<Sex, String> SexNames = {
  Sex.Male: "Мужской",
  Sex.Female: "Женский",
};

class PersonalData {
  PersonalData(
      {this.firstName = "",
      this.secondName = "",
      this.fatherName = "",
      this.sex = "",
      required this.birthday,
      this.email = "",
      this.mobileNum = "",
      this.city = "",
      this.address = ""});

  String firstName;
  String secondName;
  String fatherName;

  String sex;
  DateTime birthday;

  String email;
  String mobileNum;
  String city;
  String address;
}
