import 'package:films_hub/app/components/dialogs/error_dialog.dart';
import 'package:films_hub/app/blocs/error_bloc/error_event.dart';
import 'package:films_hub/app/blocs/error_bloc/error_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  final BuildContext _context;

  ErrorBloc(this._context) : super(const ErrorState()) {
    on<ShowDialogEvent>(_onShowDialog);
  }

  void _onShowDialog(ShowDialogEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(_context, error: '${event.title} ${event.message}');
  }
}
