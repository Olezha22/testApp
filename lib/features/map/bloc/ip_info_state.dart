part of 'ip_info_bloc.dart';

abstract class IpInfoState extends Equatable {}

class IpInfoInitial extends IpInfoState {
  @override
  List<Object?> get props => [];
}

class IpInfoLoading extends IpInfoState {
  @override
  List<Object?> get props => [];
}

class IpInfoLoaded extends IpInfoState {
  IpInfoLoaded({required this.ipInfoModel});

  final IpInfoModel ipInfoModel;

  @override
  List<Object?> get props => [ipInfoModel];
}

class IpInfoLoadingFailure extends IpInfoState {
  IpInfoLoadingFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];

  
}
