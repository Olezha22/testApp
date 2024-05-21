import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/map/models/ip_info_model.dart';
import 'package:test_app/preferences/ip_info_preferences.dart';

part 'ip_info_event.dart';
part 'ip_info_state.dart';

class IpInfoBloc extends Bloc<IpInfoEvent, IpInfoState> {
  IpInfoBloc() : super(IpInfoInitial()) {
    on<LoadIpInfo>((event, emit) async {
      try {
          emit(IpInfoLoading());

        final ip = await IpInfoRepository.getCurrentIp();
        final ipInfo = await IpInfoRepository.getIpInfo(ip);
        await RememberIpInfoPrefs.storeUserInfo(ipInfo);
        emit(IpInfoLoaded(ipInfoModel: ipInfo));
      } catch (e) {
        IpInfoModel? cachedIpInfo = await RememberIpInfoPrefs.readUserInfo();
        if(cachedIpInfo != null){
          emit(IpInfoLoaded(ipInfoModel: cachedIpInfo));
        }else{
          emit(IpInfoLoadingFailure(exception: e));
        }
      } finally {
        event.completer?.complete();
      }
    });
  }
}
