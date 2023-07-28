import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(String) deleteById;
  const TodoCard({
    Key? key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = item['id'];

    return Card(
      child: Row(
        children: [
          CircleAvatar(child: Text('${index + 1}')),
          Expanded(
            child: ListTile(
              title: Text(item['nome']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Descriçao: ${item['descricao']}'),
                  // Additional column content for 'valor'
                  // Replace 'item['valor']' with the data you want to display in the new column
                  // You can customize the appearance and content as needed
                  // For example, you can use Text('${item['valor']}') or any other widget
                  // to display different information in this column.
                  Text('Valor: R\$ ${item['valor']}'),
                ],
              ),
              trailing: PopupMenuButton(onSelected: (value) {
                if (value == 'edit') {
                  // Open Edit Page
                  navigateEdit(item);
                } else if (value == 'delete') {
                  // Delete and remove the item
                  deleteById(id);
                }
              }, itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text('Edit'),
                    value: 'edit',
                  ),
                  PopupMenuItem(
                    child: Text('Delete'),
                    value: 'delete',
                  ),
                ];
              }),
            ),
          ),
        ],
      ),
    );
  }
}
