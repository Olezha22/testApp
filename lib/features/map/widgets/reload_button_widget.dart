import 'package:flutter/material.dart';
import 'package:test_app/features/map/bloc/ip_info_bloc.dart';
import 'package:test_app/generated/l10n.dart';

class ReloadButtonWidget extends StatelessWidget {
  const ReloadButtonWidget({
    super.key,
    required IpInfoBloc ipInfoBloc,
  }) : _ipInfoBloc = ipInfoBloc;

  final IpInfoBloc _ipInfoBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.grey[300],
          ),
          onPressed: () {
            _ipInfoBloc.add(LoadIpInfo());
          },
          child:  Text(
            S.of(context).reload,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
