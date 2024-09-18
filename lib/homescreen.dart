import 'package:flutter/material.dart';
import 'package:whatsapp/database.dart';
import 'package:whatsapp/status.dart';

class Homescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  Future.delayed(Duration(seconds: 5),(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=> StatusUpdate()),
    );
  });
  return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(
  backgroundColor: Colors.black,
  title: Text('WhatsApp',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
  actions: [
    IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,size: 20,color: Colors.white,)),
    IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,size: 20,color: Colors.white,)),
    IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,size: 20,color: Colors.white,))
  ],
),
body: Column(
  children: [
    Container(
      height: 50,
      width: double.infinity,
      
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(27),color: Colors.grey),
      child: Padding(padding: EdgeInsets.all(13),
      child: Text("Search....",style: TextStyle(color: Colors.white,fontSize: 15),),),
    ),
    Expanded(child: ListView.builder(itemCount:10,itemBuilder: (context, index) {
      return ListTile(
        leading: CircleAvatar(
          radius: 18,
          foregroundImage:AssetImage(Database.listIm[index]['i1']) ,
        ),
        title: Text(Database.listIm[index]['n1'],style: TextStyle(color: Colors.white),),
        subtitle: Text(Database.listIm[index]['t1'],style: TextStyle(color: Colors.grey,fontSize: 13),),
        trailing: Text(Database.listIm[index]['t2'],style: TextStyle(color: Colors.grey),),
      );
    },)),
    Padding(padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),color: const Color.fromARGB(255, 53, 228, 59),
          ),
          child: Icon(Icons.add_comment_rounded,color: Colors.black,),
        ),
      ],
    ),
    ),
  ],
),
bottomNavigationBar: BottomNavigationBar(
  backgroundColor:  Colors.green,
  selectedItemColor: Colors.green,
  unselectedItemColor: Colors.black,
  items:[
    BottomNavigationBarItem(icon: Icon(Icons.message_outlined,color: Colors.black,),label: "Chats"),
    BottomNavigationBarItem(icon: Icon(Icons.blur_circular_rounded),label: "Updates"),
    BottomNavigationBarItem(icon: Icon(Icons.groups,),label: "Communites"),
    BottomNavigationBarItem(icon: Icon(Icons.call_sharp),label: "Calls"),
  ] 
),




  );
  }
}