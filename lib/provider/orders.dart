import 'package:flutter/foundation.dart';
import 'package:shop_app/provider/products.dart';
import 'package:shop_app/widgets/cartitem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cart.dart';
class OrderItem{
  final String id;
    final double amount;
  final List<cartitem> products;
  final DateTime dateTime;

  OrderItem({ required this.id, required this.amount,required this.products,required this.dateTime});

}
class Orders with ChangeNotifier{
late   List <OrderItem> _orders=[];
List <OrderItem> get orders{
  return [..._orders];
}
Future <void> fetchords() async{
  try{final response= await http.get(Uri.parse('https://shop-app-b2d8f-default-rtdb.europe-west1.firebasedatabase.app/orders.json')); 
final extractdata=jsonDecode(response.body) as Map <String , dynamic> ;
print(extractdata);
List <OrderItem> ords=[];
 extractdata
.forEach((ordid, ord) { 
print(ordid);
List <cartitem> prods=[];

for (int i=0;i<ord['product'].length;i++){
prods.add(cartitem(id:ordid+'${i}' , title: ord['product'][i][3], quantity: ord['product'][i][2], price:( ord['product'][i][1])));
}

ords.add(OrderItem(id: ordid,amount: ord['amount'], dateTime:DateTime.parse(ord['dateTime'])  , products:prods,));
});
_orders=ords;
notifyListeners();
}catch(eror){
  print("ee");  

throw eror;
}}
Future<void> addOrder(List<cartitem> cartproducts,double total) async {
  /*_orders.insert(0, OrderItem(id: DateTime.now()
  .toString(), amount: total, products: cartproducts, dateTime: DateTime.now()
  ));*/
      var orderulr = Uri.parse("https://shop-app-b2d8f-default-rtdb.europe-west1.firebasedatabase.app/orders.json");
var cartitems=[];
cartproducts.forEach((element) { cartitems.add([element.id,element.price,element.quantity,element.title]);});
print(cartitems);
  try{final reponse= await  http.post(orderulr,body: json.encode({
'amount':total,
'product':cartitems,
'dateTime': DateTime.now().toString(),
  }));  notifyListeners() ;
}catch(eror){print("eror");}
}
}