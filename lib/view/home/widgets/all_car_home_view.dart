import 'package:cloud_firestore/cloud_firestore.dart';import 'package:driver/view/single_car/single_cart.dart';import 'package:driver/widgets/car_list_view.dart';import 'package:firebase_auth/firebase_auth.dart';import 'package:firebase_storage/firebase_storage.dart';import 'package:flutter/material.dart';class AllCarHomeView extends StatefulWidget {  const AllCarHomeView({Key? key}) : super(key: key);  @override  State<AllCarHomeView> createState() => _AllCarHomeViewState();}class _AllCarHomeViewState extends State<AllCarHomeView> {  final FirebaseAuth _auth = FirebaseAuth.instance;  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  @override  Widget build(BuildContext context) {    var size = MediaQuery.of(context).size;    return StreamBuilder(      stream: _firestore.collection('vendor_cars').snapshots(),      builder: (context, snapshot) {        if(snapshot.connectionState == ConnectionState.waiting){          return Center(child: CircularProgressIndicator(),);        }else if(snapshot.hasData){          var data = snapshot.data as QuerySnapshot;          print(data.docs.length);          List carList = [];          //add all car to list          for(var i = 0; i < data.docs.length; i++){            var cars = data.docs[i].data() as Map<String, dynamic>; //data.docs[i].data() as Map<String, dynamic>;            for(var j = 0; j < cars["cars"].length; j++){              carList.add(cars["cars"][j]);            }          }          print("carList: ${carList.length}");          return carList.isNotEmpty ?  ListView.builder( //ListView.builder            shrinkWrap: true,            physics: NeverScrollableScrollPhysics(),            itemCount: carList.length,            itemBuilder: (_, index){              return CarListView(                size: size,                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleCar(singleCar: carList[index],))),                image: "${carList[index]["car_info"]["images"]["carImage"]}", //carList[index]["car_info"]["image"][0],                name: "${carList[index]["car_info"]["name"]}",                amount: "${carList[index]["car_info"]["price"]}",                rentReviews: "0",    //rentReviews: "67 Reviews",                totalReviews: "0",                rentVeriant: 'Day',                onAddFav: (){},              );            },          ) : Center();        }else{          return Center(child: Text("No data found"),);        }      }    );  }}