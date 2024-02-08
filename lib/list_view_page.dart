import 'package:flutter/material.dart';

import 'model/list_view_model.dart';

class ListPageView extends StatelessWidget {
  const ListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page 1"),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ElevatedButton(onPressed: (){},child: Text("Dashboard"),
                style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.green,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ElevatedButton(onPressed: (){},child: Text("Contact"),),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context , int index){
          final movieData = movieList[index];

            return ListTile(
              leading: Icon(Icons.add),
              title: Text(
                movieData.title ?? 'title'
              ),
              subtitle: Text('\$ ${movieData.revenue} \M'),
            );

          },
      ),
    );
  }
}
