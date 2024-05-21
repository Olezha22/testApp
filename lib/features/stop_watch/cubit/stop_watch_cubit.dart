import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/stop_watch/models/stop_watch_model.dart';



class StopWatchCubit extends Cubit<StopWatchModel> {
  Timer? _timer;
  int _hours = 0, _minutes = 0, _seconds = 0;

  StopWatchCubit() : super(StopWatchModel.initial());

  void start() {
    _timer?.cancel();
    emit(StopWatchModel(
      hours: state.hours,
      minutes: state.minutes,
      seconds: state.seconds,
      started: true,
    ),);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      if (_seconds == 60) {
        _seconds = 0;
        _minutes++;
      }
      if (_minutes == 60) {
        _minutes = 0;
        _hours++;
      }

      emit(
        StopWatchModel(
          hours: _hours.toString().padLeft(2, '0'),
          minutes: _minutes.toString().padLeft(2, '0'),
          seconds: _seconds.toString().padLeft(2, '0'),
          started: true,
        ),
      );
    });
  }

  void pause() {
    _timer?.cancel();
    emit(
      StopWatchModel(
        hours: state.hours,
        minutes: state.minutes,
        seconds: state.seconds,
        started: false,
      ),
    );
  }

  void reset() {
    _timer?.cancel();
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    emit(StopWatchModel.initial());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
