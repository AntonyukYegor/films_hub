import 'package:films_hub/app/components/locals/locals.dart';
import 'package:flutter/material.dart';

class NotGettingAnyResults extends StatelessWidget {
  const NotGettingAnyResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 64, top: 40, right: 64, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.search),
          ),
          Text(
            context.locale.common.notGettingAnyResults,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
