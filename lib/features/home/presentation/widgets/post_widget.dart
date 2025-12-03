import 'package:flutter/material.dart';
import 'package:saveday/core/constants/app_icons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
          borderRadius: BorderRadius.circular(6),
          child: Image.network(imageurl),
        ),
        // content & action
        const SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                content,
                style: ShadTheme.of(context).textTheme.h4,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ShadButton.ghost(
              onPressed: () {},
              padding: const EdgeInsets.only(left: 6),
              child: SvgPicture.asset(AppIcons.menu, width: 20, height: 20),
            ),
          ],
        ),
      ],
    );
  }
}
