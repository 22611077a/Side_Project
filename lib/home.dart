import 'package:flutter/material.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/model/todo.dart';

class Home extends StatefulWidget{
  Home({Key? key}) : super(key:key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final todocontroller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF5),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title:Text('待辦事項')
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          '所有事項',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ),

                      for(ToDo todo in todoList)
                        ToDoItem(
                          todo:todo,
                          onToDoChange:Change ,
                          onDeleteItem:delete ,
                        ),
                    ],
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    )],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: todocontroller,
                    decoration: InputDecoration(
                      hintText: '新增一個待辦事項',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text('+',style: TextStyle(fontSize: 40),),
                  onPressed: (){
                    addtodo(todocontroller.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ],),
          )
        ],
      ),
    );
  }

  void Change(ToDo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

  void delete(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addtodo(String toDo){
    setState(() {
      todoList.add(ToDo(
          id:DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    todocontroller.clear();
  }
}


