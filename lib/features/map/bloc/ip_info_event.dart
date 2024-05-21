part of 'ip_info_bloc.dart';

abstract class IpInfoEvent extends Equatable{}

class LoadIpInfo extends IpInfoEvent {
  LoadIpInfo({ this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
