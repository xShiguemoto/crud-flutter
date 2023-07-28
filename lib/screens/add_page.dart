import 'package:flutter/material.dart';
import 'package:flutter_crud/services/todo_service.dart';
import 'package:flutter_crud/utils/snackbar_helper.dart';

class AddTodoPage extends StatefulWidget {
  final Map? todo;
  const AddTodoPage({
    super.key,
    this.todo,
  });

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? 'Edit Todo' : 'Adicionar Itens',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Produto'),
          ),
          TextField(
            controller: valorController,
            decoration: InputDecoration(hintText: 'Valor'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Descrição'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: isEdit ? updateData : submitData,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                isEdit ? 'Update' : 'Adicionar',
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> updateData() async {
    // Get the data from form
    final todo = widget.todo;
    if (todo == null) {
      print('You can not call update without todo data');
      return;
    }
    final id = todo['_id'];

    // Submit update data to the server
    final isSucess = await TodoService.UpdateTodo(id, body);

    //show  sucess or fail message based on status
    if (isSucess) {
      showSucessMessage(context, message: 'Atualizado com Sucesso');
    } else {
      showErroMessage(context, message: 'Atualização falhou');
    }
  }

  Future<void> submitData() async {
    // Submit data to the server
    final isSuccess = await TodoService.AddTodo(body);

    //show  sucess or fail message based on status
    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      print('Create Sucess');
      showSucessMessage(context, message: 'Criado com Sucesso');
    } else {
      print('Create Failed');
      showErroMessage(context, message: 'Falha ao Criar');
    }
  }

  Map get body {
    final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }
}
