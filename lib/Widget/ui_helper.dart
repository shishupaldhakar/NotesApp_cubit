import 'package:flutter/material.dart';

class UiHelper{
  static CustomTextField(
      TextEditingController controller, String text, IconData icon
      ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: TextField(controller: controller,
        decoration: InputDecoration(
          hintText: text,
          border:OutlineInputBorder(
            borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)
          ),

          suffixIcon: Icon(icon,color: Colors.white,),
          fillColor:Colors.green,
          filled: true
        ),
      ),
    );
  }
}