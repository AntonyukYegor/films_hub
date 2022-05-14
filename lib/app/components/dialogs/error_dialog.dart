import 'package:films_hub/app/components/locals/locals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showErrorDialog(BuildContext context, {required String error}) {
  SchedulerBinding.instance?.addPostFrameCallback((_) => showDialog(
    context: context,
    builder: (_) => ErrorDialog(error),
  ));
}

class ErrorDialog extends StatelessWidget {
  final String? error;

  const ErrorDialog(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(36),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CloseButton(color: Colors.white),
                  ],
                ),
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(height: 12),
                Text(
                  '${context.locale.movie.error} ${error ?? context.locale.movie.unknown}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
