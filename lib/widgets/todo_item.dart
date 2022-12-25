import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class ToDoItem extends StatelessWidget{
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;

  const ToDoItem({Key? key,required this.todo,required this.onToDoChange,required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(bottom: 15),
        child:ListTile(
          onTap: (){
            onToDoChange(todo);
          },
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ) ,
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone? Icons.check_box :Icons.check_box_outline_blank,
            color: Colors.blue,),
          title: Text(
              todo.todoText!,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                decoration: todo.isDone? TextDecoration.lineThrough:null,
          ),),
          trailing: Container(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.symmetric(vertical: 7),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 16,
              icon: Icon(Icons.delete),
              onPressed: (){
                onDeleteItem(todo.id);
              },
            ),
          ),
        )
    );
  }
}