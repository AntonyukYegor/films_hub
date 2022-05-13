import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/domain/models/settings_arguments.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({required this.arguments, Key? key}) : super(key: key);

  final SettingsArguments arguments;

  static const navigationPath = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        flexibleSpace: const AppBarFlexibleSpace(
            AppStyle.appBarBorderRadius, SettingsLocal.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( '${SettingsLocal.user}${arguments.name}'),
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(Icons.exit_to_app),
                  Text(SettingsLocal.exit),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(Icons.arrow_back),
                  Text(SettingsLocal.back),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
