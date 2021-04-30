import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isTextValid => newTodoTitle.isNotEmpty;

  ObservableList<ToDoStore> todoList = ObservableList<ToDoStore>();

  @action
  void addTodo() {
    todoList.insert(0, ToDoStore(newTodoTitle));
    newTodoTitle = "";
  }
}
