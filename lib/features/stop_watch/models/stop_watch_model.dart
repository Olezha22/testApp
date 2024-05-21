import 'package:equatable/equatable.dart';

class StopWatchModel extends Equatable {
  final String hours;
  final String minutes;
  final String seconds;
  final bool started;

  const StopWatchModel({
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.started,
  });

  factory StopWatchModel.initial() {
    return const StopWatchModel(
      hours: '00',
      minutes: '00',
      seconds: '00',
      started: false,
    );
  }

  @override
  List<Object?> get props => [hours, minutes, seconds, started];
}