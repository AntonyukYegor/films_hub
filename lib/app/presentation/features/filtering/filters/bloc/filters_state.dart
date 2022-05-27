import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FiltersState extends Equatable {
  final bool isExpanded;
  final List<String> selectedLanguages;
  final RangeValues voteAverageRange;
  final String textPattern;

  const FiltersState({
    required this.isExpanded,
    required this.selectedLanguages,
    required this.voteAverageRange,
    required this.textPattern,
  });

  FiltersState copyWith({
    bool? isExpanded,
    List<String>? selectedLanguages,
    RangeValues? voteAverageRange,
    String? textPattern,
  }) =>
      FiltersState(
        isExpanded: isExpanded ?? this.isExpanded,
        selectedLanguages: selectedLanguages ?? this.selectedLanguages,
        voteAverageRange: voteAverageRange ?? this.voteAverageRange,
        textPattern: textPattern ?? this.textPattern,
      );

  @override
  List<Object> get props => [
        isExpanded,
        selectedLanguages,
        voteAverageRange,
        textPattern,
      ];
}
