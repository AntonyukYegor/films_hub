import 'package:cached_network_image/cached_network_image.dart';
import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/presentation/common/widgets/shimmers/app_theme_shimmer_container.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(this.pictureUrl, {this.fit = BoxFit.fitHeight, Key? key})
      : super(key: key);

  final String pictureUrl;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: pictureUrl,
      fit: fit,
      progressIndicatorBuilder: (_, __, ___) => AppThemeShimmerContainer(
        child: Image.asset(
          AppStyle.posterPlaceHolderPath,
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (_, __, ___) => Image.asset(
        AppStyle.posterPlaceHolderPath,
        fit: BoxFit.cover,
      ),
      cacheManager: MoviePictures.pictureCache,
    );
  }
}
