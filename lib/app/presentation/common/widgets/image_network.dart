import 'package:films_hub/app/presentation/common/widgets/shimmers/app_theme_shimmer_container.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(this.pictureUrl, {this.fit = BoxFit.fitHeight, Key? key})
      : super(key: key);

  final String pictureUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      pictureUrl,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return AppThemeShimmerContainer(
          child: Image.asset(
            "assets/images/poster-placeholder.jpg",
            fit: BoxFit.cover,
          ),
        );
      },
      errorBuilder: (BuildContext context,
          Object error,
          StackTrace? stackTrace) {
        return Image.asset(
        "assets/images/poster-placeholder.jpg",
        fit: BoxFit.cover);
      },
      fit: fit,
    );
  }
}
