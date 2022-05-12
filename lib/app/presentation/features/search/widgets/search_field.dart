import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/presentation/common/widgets/app_theme_card_background_without_shadow.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField(
      {Key? key,
      required String initialText,
      required void Function(String text) onSearchFieldTextChanged})
      : _initialText = initialText,
        _onSearchFieldTextChanged = onSearchFieldTextChanged,
        super(key: key);
  final String _initialText;
  final void Function(String text) _onSearchFieldTextChanged;

  @override
  State<SearchField> createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textController.text = widget._initialText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
      child: Stack(
        children: [
          const Positioned.fill(
              child: AppThemeCardBackgroundWithoutShadow(
                  AppStyle.randomBackgroundImageUrl, 16, 0)),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Theme(
              data: Theme.of(context).copyWith(
                  focusColor: Theme.of(context).textTheme.titleSmall?.color),
              child: TextField(
                controller: _textController,
                maxLines: 1,
                autofocus: false,
                cursorColor: Theme.of(context).textTheme.titleSmall?.color,
                decoration: InputDecoration(
                  focusColor: Theme.of(context).textTheme.titleSmall?.color,
                  hoverColor: Theme.of(context).textTheme.titleSmall?.color,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelText: 'Search',
                  labelStyle: TextStyle(
                    color: Theme.of(context).textTheme.titleSmall?.color,
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
                onChanged: widget._onSearchFieldTextChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
