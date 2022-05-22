import 'package:films_hub/app/components/constants.dart';
import 'package:films_hub/app/components/locals/locals.dart';
import 'package:films_hub/app/presentation/common/widgets/buttons/settings_button.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_event.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_state.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const navigationPath = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        flexibleSpace: AppBarFlexibleSpace(
            AppStyle.appBarBorderRadius, context.locale.settings.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<SettingsBloc, SettingsState>(
              buildWhen: (oldState, newState) =>
              oldState.themeMode != newState.themeMode,
              builder: (context, state) => Column(
                  children: <Widget>[
                    RadioListTile<ThemeMode>(
                      title: Text(context.locale.settings.darkThemeMode),
                      value: ThemeMode.dark,
                      groupValue: state.themeMode,
                      onChanged: _onThemeModeChanged,
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text(context.locale.settings.lightThemeMode),
                      value: ThemeMode.light,
                      groupValue: state.themeMode,
                      onChanged: _onThemeModeChanged,
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text(context.locale.settings.systemThemeMode),
                      value: ThemeMode.system,
                      groupValue: state.themeMode,
                      onChanged: _onThemeModeChanged,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    BlocBuilder<SettingsBloc, SettingsState>(
                      builder: (context, state) => Checkbox(
                        value: state.isEnLocale,
                        onChanged: (val) {
                          final isEnLocale = val ?? false;
                          context
                              .read<SettingsBloc>()
                              .add(UpdateLocaleEvent(value: isEnLocale));
                        },
                      ),
                    ),
                    Flexible(
                      child: Text(context.locale.settings.switchLanguage),
                    ),
                  ],
                ),
              ),
              BlocBuilder<SettingsBloc, SettingsState>(
                  buildWhen: (oldState, newState) =>
                  oldState.name != newState.name,
                  builder: (_, state) {
                    return Text(state.name);
                  }),
              SettingsButton(context.locale.settings.getName, onPressed: () {
                context.read<SettingsBloc>().add(LoadNameEvent());
              }),
              SettingsButton(context.locale.settings.saveName,
                  onPressed: () => context
                      .read<SettingsBloc>()
                      .add(const SaveNameEvent(name: 'Egor'))),
              SettingsButton(context.locale.settings.clearName,
                  onPressed: () =>
                      context.read<SettingsBloc>().add(ClearNameEvent())),
              ElevatedButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.exit_to_app),
                    Text(context.locale.settings.exit),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.arrow_back),
                    Text(context.locale.settings.back),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onThemeModeChanged(ThemeMode? value) {
    if(value!=null) {
      context.read<SettingsBloc>().add(ChangeThemeModeEvent(value!));
    }
  }
}
