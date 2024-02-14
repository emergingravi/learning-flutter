import "package:flutter/material.dart";

class ListViewModel{
  IconData? icon;
  String? title;
  double? revenue;

  ListViewModel({this.icon , this.title ,this.revenue});
}

final List<ListViewModel>movieList=[
  ListViewModel(icon:Icons.plus_one, title:"The Girls ",revenue:6.9),
  ListViewModel(icon:Icons.abc, title:"image 1 ",revenue:6.9),
  ListViewModel(icon:Icons.airplane_ticket, title:"image 2",revenue:6.9),
  ListViewModel(icon:Icons.plus_one, title:"image 3",revenue:6.9),
];