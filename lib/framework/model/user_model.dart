class UserModel {
  final String uid;
  final String? name;
  final String? email;
  final String? imageUrl;
  final String? petName;
  final String? gender;
  final String? type;
  final String? breed;
  final String? age;
  final String? weight;
  final String? diet;
  final String? condition;

  UserModel({this.imageUrl,this.name,this.email,required this.uid,this.petName,
    this.gender,this.type, this.breed, this.age, this.weight, this.diet,
    this.condition,});

  // Convert User object to a Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {'name': name,'email': email,'uid':uid,'petName': petName,
      'gender': gender,'type': type,'breed' :breed,'age' :age,
      'weight' :weight, 'diet':diet, 'condition':condition,};
  }

  // Factory method to create a User object from a Map<String, dynamic>
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

      name: json['name'],
      email: json['email'],
      uid: json['uid'],
      imageUrl: json['imageUrl'],
      petName: json['petName'],
      gender: json['gender'],
      type: json['type'],
      breed: json['breed'],
      age: json['age'],
      weight: json['weight'],
      diet: json['diet'],
      condition: json['condition'],
    );
  }
}