import 'package:flutter/material.dart';
import 'package:todo_list/theme/app_styles.dart';

class TodoWidget extends StatefulWidget {
  final String title;
  final String description;
  final bool isActive;
  final VoidCallback onDelete;

  const TodoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.isActive,
    required this.onDelete});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.title, style: AppStyles.black16Text,),
                  const SizedBox(width: 16,),
                  InkWell(onTap: widget.onDelete, child: const Icon(Icons.delete))
                ],
              ),
              const SizedBox(height: 10,),
              Text(widget.description)
            ],
          ),
          Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }
          )
        ],
      ),
    );
  }
}