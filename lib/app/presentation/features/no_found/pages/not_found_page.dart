import 'package:films_hub/app/components/constants.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text(NoFoundLocal.pageNoFound)),
    );
  }
}
