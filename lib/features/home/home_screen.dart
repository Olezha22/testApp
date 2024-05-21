import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/actions/actions.dart';
import 'package:test_app/features/home/cubit/localization_cubit.dart';
import 'package:test_app/features/map/map.dart';
import 'package:test_app/features/stop_watch/stop_watch.dart';
import 'package:test_app/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            DropdownButton<Locale>(
              value: BlocProvider.of<LocalizationCubit>(context).state,
              icon: const Icon(Icons.language, color: Colors.white),
              items: S.delegate.supportedLocales.map((Locale locale) {
                return DropdownMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode.toUpperCase()),
                );
              }).toList(),
              onChanged: (Locale? locale) {
                if (locale != null) {
                  BlocProvider.of<LocalizationCubit>(context).setLocale(locale);
                }
              },
            ),
          ],
          bottom:  TabBar(
            tabs: [
              Tab(text: S.of(context).stopWatch),
              Tab(text: S.of(context).location),
              Tab(text: S.of(context).actions),
            ],
            labelColor: Colors.black,
            indicatorColor: Colors.grey,
          ),
        ),
        body: const TabBarView(
          children: [
            StopWatchScreen(),
            MapScreen(),
            ActionsScreen(),
          ],
        ),
      ),
    );
  }
}




