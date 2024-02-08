import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List page"),
        centerTitle: true,
      ),

      body:
      ListView(
        scrollDirection: Axis.vertical,
         children: [
         Image.network("https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg" ,height:400,width: 500,),
          SizedBox(
            height: 10,
          ),
          Text("Nepal",style: TextStyle(
            fontSize: 30,
          ),),
          SizedBox(
            height: 30,
          ),
          Text("In terms of biodiversity, Nepal is one of the richest countries in the world. It is rightfully called Amazon of Asia as it is a home for the variety of unique species of Flora and Fauna. Nepal has more than 900 species of birds, which accounts to 8.9% of the total species of birds all around the world",style:TextStyle(fontSize: 20),),
          Text("In terms of biodiversity, Nepal is one of the richest countries in the world. It is rightfully called Amazon of Asia as it is a home for the variety of unique species of Flora and Fauna. Nepal has more than 900 species of birds, which accounts to 8.9% of the total species of birds all around the world",style:TextStyle(fontSize: 20),),
          Text("In terms of biodiversity, Nepal is one of the richest countries in the world. It is rightfully called Amazon of Asia as it is a home for the variety of unique species of Flora and Fauna. Nepal has more than 900 species of birds, which accounts to 8.9% of the total species of birds all around the world",style:TextStyle(fontSize: 20),),
        ],
      ),
    );
  }
}
