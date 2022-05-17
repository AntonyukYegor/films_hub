import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();
}

class ChangeWidgetExpandedEvent extends FiltersEvent {
  final bool isExpanded;

  const ChangeWidgetExpandedEvent({required this.isExpanded});

  @override
  List<Object> get props => [isExpanded];
}

class ChangeFilterPatternEvent extends FiltersEvent {
  final String textPattern;

  const ChangeFilterPatternEvent({required this.textPattern});

  @override
  List<Object> get props => [textPattern];
}

class ChangeVoteAverageRangeEvent extends FiltersEvent {
  final RangeValues range;

  const ChangeVoteAverageRangeEvent({required this.range});

  @override
  List<Object> get props => [range];
}

class ChangeLanguageFilterEvent extends FiltersEvent {
  final List<String> selectedLanguage;

  const ChangeLanguageFilterEvent({required this.selectedLanguage});

  @override
  List<Object> get props => [selectedLanguage];
}