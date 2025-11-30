import 'package:flutter/material.dart';
import 'package:saveday/core/constants/app_icons.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.imageurl, required this.content});

  final String imageurl;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // image
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imageurl),
        ),
        // content & action
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                content,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(AppIcons.dotthree)),
          ],
        ),
      ],
    );
  }
}
