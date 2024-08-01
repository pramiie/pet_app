class ProductModel{
  static List<Item>? items;
//get item by Id
  static Item getById(int id)=>
      items!.firstWhere((element) => element.id==id,orElse: null);
  //get item by position
  static Item getByPosition(int pos)=>items![pos];
}
class Item {
  final num id;
  final String name;
  final num star;
  final String desc;
  final num price;
  final String day;
  final String image;

  Item({ required this.id,required this.name,required this.star,
    required this.desc,required this.price,required this.day,required this.image});

  factory Item.fromMap(Map<String,dynamic>map){
    return Item(
      id: map["id"],
      name:map["name"],
      star:map["star"],
      desc:map["desc"],
      price:map["price"],
      day: map["day"],
      image:map["image"],
    );
  }
  toMap()=>{
    "id":id,
    "name":name,
    "desc":desc,
    "price":price,
    "day":day,
    "image":image,
  };
}
