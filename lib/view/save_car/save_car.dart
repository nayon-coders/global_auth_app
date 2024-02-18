import 'package:driver/utilitys/colors.dart';import 'package:driver/view/home/widgets/home_search.dart';import 'package:driver/widgets/car_list_view.dart';import 'package:flutter/material.dart';import '../single_car/single_cart.dart';class SaveCars extends StatefulWidget {  const SaveCars({Key? key}) : super(key: key);  @override  State<SaveCars> createState() => _SaveCarsState();}class _SaveCarsState extends State<SaveCars> {  final _searchController = TextEditingController();  @override  Widget build(BuildContext context) {    var size = MediaQuery.of(context).size;    return Container(      width: size.width,      height: size.height,      padding: EdgeInsets.all(20),      child: SingleChildScrollView(        child: Column(          mainAxisAlignment: MainAxisAlignment.start,          crossAxisAlignment: CrossAxisAlignment.start,          children: [            ListView.builder(              shrinkWrap: true,              physics: NeverScrollableScrollPhysics(),              itemCount: 10,              itemBuilder: (_, index){                return CarListView(                  size: size,                  onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleCar())),                  image: "https://pngimg.com/d/mercedes_PNG80195.png",                  name: "TESLA SE - 2024",                  amount: "450",                  rentReviews: "4.5",                  totalReviews: "67",                  rentVeriant: 'Day',                  onAddFav: (){},                );              },            )          ],        ),      ),    );  }}