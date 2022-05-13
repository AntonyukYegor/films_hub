import 'package:films_hub/app/presentation/common/widgets/app_theme_card_background.dart';
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
      padding: const EdgeInsets.only(left: 16, top: 32, right: 16),
      child: Stack(
        children: [
          const AppThemeCardBackground('https://picsum.photos/4', 8, 0),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: TextField(
              controller: _textController,
              maxLines: 1,
              autofocus: false,
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelText: 'Search',
                filled: true,
                fillColor: Colors.transparent,
              ),
              onChanged: widget._onSearchFieldTextChanged,
            ),
          ),
        ],
      ),
    );
  }
}
