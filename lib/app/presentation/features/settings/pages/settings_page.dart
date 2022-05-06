import 'package:films_hub/app/presentation/common/widgets/buttons/settings_button.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_bloc.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_event.dart';
import 'package:films_hub/app/presentation/features/settings/bloc/settings_state.dart';
import 'package:films_hub/app/presentation/common/widgets/appbar/app_bar_flexible_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const navigationPath = '/settings';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        lazy: false,
        create: (_) => SettingsBloc()
          ..add(
            LoadNameEvent(),
          ),
        child: const SettingsPageContent());
  }
}

class SettingsPageContent extends StatefulWidget {
  const SettingsPageContent({Key? key}) : super(key: key);

  @override
  State<SettingsPageContent> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        flexibleSpace: const AppBarFlexibleSpace(32, "Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
                buildWhen: (oldState, newState) =>
                oldState.name != newState.name,
                builder: (context2, state) {
                  return Text(state.name);
                }),
            SettingsButton('Get name', onPressed: () {
              context.read<SettingsBloc>().add(LoadNameEvent());
            }),
            SettingsButton('Save name',
                onPressed: () => context
                    .read<SettingsBloc>()
                    .add(const SaveNameEvent(name: 'Egor'))),
            SettingsButton('Clear name',
                onPressed: () =>
                    context.read<SettingsBloc>().add(ClearNameEvent())),
            ElevatedButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Icon(Icons.exit_to_app),
                  Text('Exit'),
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
                  Text('Back'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
