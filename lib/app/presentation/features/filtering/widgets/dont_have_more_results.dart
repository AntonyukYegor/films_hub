import 'package:films_hub/app/components/constants.dart';
import 'package:flutter/material.dart';

class DontHaveMoreResults extends StatelessWidget {
  const DontHaveMoreResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          CommonLocal.dontHaveMoreResults,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
