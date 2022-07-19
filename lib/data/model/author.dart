class User {
  final String name;
  final int age;
  final String bio;
  final String position;
  final String job;
  final String company;
  final String address;
  final bool isPremium;
  final String avatar;

  User({
    required this.name,
    required this.age,
    required this.bio,
    required this.position,
    required this.job,
    required this.company,
    required this.address,
    required this.isPremium,
    required this.avatar,
  });
  factory User.fromJson(Map<String, dynamic> parsejson) {
    return User(
      name: parsejson['name'],
      age: parsejson['age'],
      bio: parsejson['bio'],
      position: parsejson['position'],
      job: parsejson['job'],
      company: parsejson['company'],
      address: parsejson['address'],
      isPremium: parsejson['isPremium'] ?? false,
      avatar: parsejson['avatar'],
    );
  }
  @override
  String toString() {
    return ' name: $name , age: $age, bio : $bio, company: $company, address: $address, ispremium: $isPremium, avatar: $avatar,';
  }
}
