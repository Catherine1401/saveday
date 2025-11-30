import 'package:flutter/material.dart';
import 'package:saveday/core/constants/app_icons.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.imageurl, required this.content});

  final String imageurl;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image
        Image.network(imageurl),
        // content & action
        Row(
          children: [
            Expanded(child: Text(content, maxLines: 2, overflow: TextOverflow.ellipsis)),
            IconButton(onPressed: () {}, icon: Icon(AppIcons.dotthree)) 
          ],
        ),
      ],
    );
  }
}
