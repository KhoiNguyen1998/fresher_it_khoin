class User {
  String name;
  final int age;
  final String bio;
  final String position;
  final String job;
  final String company;
  final String address;
  bool isPremium = true;
  final String image;

  User({
    required this.name,
    required this.age,
    required this.bio,
    required this.position,
    required this.job,
    required this.company,
    required this.address,
    this.isPremium = true,
    required this.image,
  });
  factory User.fromJson(Map<String, dynamic> parsejson) {
    return User(
      name: parsejson['name'] as String,
      age: parsejson['age'] as int,
      bio: parsejson['bio'] as String,
      position: parsejson['position'] as String,
      job: parsejson['job'] as String,
      company: parsejson['company'] as String,
      address: parsejson['address'] as String,
      isPremium: parsejson['sPremium'] ?? true,
      image: parsejson['avatar'] as String,
    );
  }
}
