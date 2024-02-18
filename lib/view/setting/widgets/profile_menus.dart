import 'package:driver/utilitys/colors.dart';import 'package:flutter/material.dart';class ProfileMenus extends StatelessWidget {  const ProfileMenus({    super.key, required this.text, required this.leadingIcon, this.trailingIcon= Icons.double_arrow, required this.onClick, this.trailingIconColor = AppColors.grey,  });  final String text;  final IconData leadingIcon;  final IconData trailingIcon;  final Color trailingIconColor;  final VoidCallback onClick;  @override  Widget build(BuildContext context) {    return InkWell(        onTap: onClick,        child: Container(          margin: EdgeInsets.only(bottom: 15),          decoration: BoxDecoration(              color: AppColors.white,              borderRadius: BorderRadius.circular(10),              boxShadow: [                BoxShadow(                    color: Colors.grey.shade200,                    blurRadius: 5,                    spreadRadius: 2,                    offset: Offset(0, 1)                )              ]          ),          child: ListTile(            leading: Icon(leadingIcon, color: AppColors.grey,),            title: Text("$text",              style: TextStyle(                  fontSize: 14,                  color: AppColors.grey,                  fontWeight: FontWeight.w600              ),            ),            trailing: Icon(trailingIcon, color: trailingIconColor,),          ),        ));  }}