import 'package:films_hub/app/components/locals/locals.dart';
import 'package:flutter/material.dart';

class ShortDetailsMovie extends StatelessWidget {
  const ShortDetailsMovie(this._language, this._description, {Key? key})
      : super(key: key);
  final String _language;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        margin: const EdgeInsets.only(top: 4, bottom: 1),
                        child: Text(
                          _language,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  const FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      Icons.language,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(context.locale.shortDetails.descriptionTitle,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                )),
          ),
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                context.locale.common.tab + _description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
