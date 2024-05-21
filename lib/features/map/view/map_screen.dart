import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/map/bloc/ip_info_bloc.dart';
import 'package:test_app/features/map/widgets/widgets.dart';
import 'package:test_app/generated/l10n.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _ipInfoBloc = IpInfoBloc();

  @override
  void initState() {
    _ipInfoBloc.add(LoadIpInfo());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<IpInfoBloc, IpInfoState>(
        bloc: _ipInfoBloc,
        builder: (context, state) {
          if (state is IpInfoLoaded) {
            final ipInfo = state.ipInfoModel;
            return RefreshIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
              onRefresh: () async {
                final completer = Completer<void>();
                _ipInfoBloc.add(LoadIpInfo(completer: completer));
                return completer.future;
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GoogleMapWidget(ipInfo: ipInfo),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        buildInfoItem(S.of(context).status, ipInfo.status),
                        buildInfoItem(S.of(context).country, ipInfo.country),
                        buildInfoItem(
                            S.of(context).countryCode, ipInfo.countryCode),
                        buildInfoItem(S.of(context).region, ipInfo.region),
                        buildInfoItem(
                            S.of(context).regionName, ipInfo.regionName),
                        buildInfoItem(S.of(context).city, ipInfo.city),
                        buildInfoItem(S.of(context).zip, ipInfo.zip),
                        buildInfoItem(S.of(context).lat, ipInfo.lat.toString()),
                        buildInfoItem(S.of(context).lon, ipInfo.lon.toString()),
                        buildInfoItem(S.of(context).timezone, ipInfo.timezone),
                        buildInfoItem(S.of(context).isp, ipInfo.isp),
                        buildInfoItem(S.of(context).org, ipInfo.org),
                        buildInfoItem(S.of(context).as, ipInfo.as),
                        buildInfoItem(
                            S.of(context).ipAddress, ipInfo.ipAddress),
                      ],
                    ),
                    ReloadButtonWidget(ipInfoBloc: _ipInfoBloc),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            );
          }
          if (state is IpInfoLoadingFailure) {
            return RefreshIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
              onRefresh: () async {
                final completer = Completer<void>();
                _ipInfoBloc.add(LoadIpInfo(completer: completer));
                return completer.future;
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).error,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ReloadButtonWidget(ipInfoBloc: _ipInfoBloc),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
