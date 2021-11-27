

import 'package:flutter/material.dart';



class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child:Row(
      children: [


        Expanded(child:Container(height: 80,
          padding: EdgeInsets.only(top:35,left: 15,right: 5,bottom: 5,),
          width: double.infinity,
          color: Colors.white,
          child: TextField(
            decoration: InputDecoration(labelText: 'search your  product',suffixStyle: TextStyle(color: Colors.yellow),
              filled: true,
              fillColor: Colors.brown,
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(25,
                  ),borderSide: BorderSide(color: Colors.grey)
              ),
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(25,
                  ),borderSide: BorderSide(color: Colors.blue)
              ),
            ),
          ),),
        ),
        // Container(height:80,
        //   color:Colors.white,
        //   child: Icon(Icons.search),)



      ],
    ) ,


    );
  }
}
