import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final String name;

  const SettingsState({required this.name});

  SettingsState copyWith({
    String? name,
  }) =>
      SettingsState(name: name ?? this.name);

  @override
  List<Object> get props => [name];
}
