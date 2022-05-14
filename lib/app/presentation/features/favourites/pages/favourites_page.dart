import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:films_hub/app/presentation/features/catalog/widgets/movies_grid.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:films_hub/app/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppStyle.appBarBorderRadius),
            bottomRight: Radius.circular(AppStyle.appBarBorderRadius),
          ),
        ),
        flexibleSpace: AppBarFlexibleSpace(
            AppStyle.appBarBorderRadius, context.locale.favourites.title),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverPadding(
              padding: EdgeInsets.only(top: AppStyle.safePadding)),
          Builder(builder: (context) {
            return BlocBuilder<FavouritesBloc, FavouritesState>(
                buildWhen: (oldState, newState) => oldState != newState,
                builder: (context, state) {
              return MoviesGrid(
                films: state.films,
              );
            });
          }),
          const SliverPadding(
              padding: EdgeInsets.only(bottom: AppStyle.safePadding)),
          const SliverPadding(
              padding: EdgeInsets.only(bottom: AppStyle.safePadding)),
        ],
      ),
    );
  }
}
