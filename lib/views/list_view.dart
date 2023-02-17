import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListViewTile extends StatelessWidget {
  final imageUrl;
  final title;
  final VoidCallback handleChange;

  final description;
  const ListViewTile(
      {super.key,
      required this.imageUrl,
      this.title,
      this.description,
      required this.handleChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: handleChange,
      leading: CircleAvatar(
          child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )),
      title: Text(title),
      subtitle: Text(description),
      contentPadding: const EdgeInsets.all(10),
    );
  }
}
