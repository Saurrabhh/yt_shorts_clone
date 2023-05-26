import 'package:flutter/material.dart';

class TextDescription extends StatefulWidget {
  const TextDescription({Key? key, required this.title, required this.description}) : super(key: key);
  final String title;
  final String description;

  @override
  State<TextDescription> createState() => _TextDescriptionState();
}

class _TextDescriptionState extends State<TextDescription> {
  bool isFull = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25),),
        GestureDetector(
            onTap: () => setState(() {
              isFull = !isFull;
            }),
            child: Text(widget.description,style: Theme.of(context).textTheme.bodyMedium,maxLines: isFull ? null : 2,)),
      ],
    );
  }
}