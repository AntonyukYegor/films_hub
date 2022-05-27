import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final String name;

  final bool isEnLocale;

  const SettingsState({required this.name, required this.isEnLocale});

  SettingsState copyWith({String? name, bool? isEnLocale}) => SettingsState(
        name: name ?? this.name,
        isEnLocale: isEnLocale ?? this.isEnLocale,
      );

  @override
  List<Object> get props => [name, isEnLocale];
}
