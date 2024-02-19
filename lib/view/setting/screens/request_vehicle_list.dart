import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utilitys/colors.dart';
import '../../../widgets/car_list_view.dart';
import '../../single_car/single_cart.dart';


class RequestVehiclesList extends StatefulWidget {
  const RequestVehiclesList({super.key});

  @override
  State<RequestVehiclesList> createState() => _RequestVehiclesListState();
}

class _RequestVehiclesListState extends State<RequestVehiclesList> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: AppColors.mainBg,
      appBar: AppBar(
        backgroundColor: Color(0xffF3F3F3),
        elevation: 0,
        title: const Text("Request Vehicle's List",
          style: TextStyle(
              color: AppColors.black,
              fontSize: 19
          ),
        ),
        leading: InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(Icons.arrow_back, color: AppColors.black, size: 20,),
              ),
            )),

      ),
      body:StreamBuilder(
        stream: _firestore.collection("drivers_send_request").snapshots(),
        builder: (context, snapshot) {

         if(snapshot.connectionState == ConnectionState.waiting) {
           return const Center(
             child: CircularProgressIndicator(color: AppColors.mainColor,),);
         }else if(snapshot.hasData){
           if(snapshot.data!.docs!.length == 0) {
             return const Center(
               child: Text("No Data Found"),
             );
           }else{
             return Container(
               width: size.width,
               height: size.height,
               padding: EdgeInsets.all(20),
               child: ListView.builder(
                 shrinkWrap: true,
                 itemCount: snapshot.data!.docs.length,
                 itemBuilder: (_, index){
                   var data =  snapshot.data!.docs[index].data(); //get data

                   //only show my data
                    if(data["driver"]["email"] == _auth.currentUser!.email){
                      return CarListView(
                        size: size,
                        data: data,
                        carId: data["car"]["car_info"]["id"],
                        onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SingleCar(singleCar: data["car"],))),
                        image: "${data["car"]["car_info"]["images"]["carImage"]}",
                        name: "${data["car"]["car_info"]["name"]}",
                        amount: "${data["car"]["car_info"]["price"]}",
                        rentReviews: "0",
                        totalReviews: "0",
                        isFav: true,
                        rentVeriant: 'Day',
                        onAddFav: (){},
                      );
                    }else{
                      return const Center(child: Text("No data found"),);
                    }

                 },
               ),

             );
           }
         }else{
           return const Center(
             child: Text("No Data Found"),
           );
         }
        }
      )
    );
  }
}
