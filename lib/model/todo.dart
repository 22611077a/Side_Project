class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
});

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01',todoText: '印講義',isDone: true),
      ToDo(id: '02',todoText: '買筆',isDone: true),
      ToDo(id: '03',todoText: '訂車票',isDone: false),
      ToDo(id: '04',todoText: '寫作業',isDone: true),
      ToDo(id: '05',todoText: '計畫旅遊',isDone: false),
      ToDo(id: '06',todoText: '找老師',isDone: true),
    ];
  }
}