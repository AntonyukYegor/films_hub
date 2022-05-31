import 'package:flutter/material.dart';

class MovieGridViewCardSkeleton extends StatelessWidget {
  const MovieGridViewCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).shadowColor,
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
        color: Theme.of(context).primaryColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 4,
                  ),
                ],
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
    );
  }
}
