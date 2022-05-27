import 'package:films_hub/app/components/locals/locals.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(context.locale.noFound.pageNoFound)),
    );
  }
}
