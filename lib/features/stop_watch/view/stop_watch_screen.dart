import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/stop_watch/cubit/stop_watch_cubit.dart';
import 'package:test_app/features/stop_watch/models/stop_watch_model.dart';
import 'package:test_app/features/stop_watch/widgets/widgets.dart';


class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StopWatchCubit, StopWatchModel>(
        builder: (context, state) {
          final cubit = context.read<StopWatchCubit>();
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StopWatchText(
                  digitHours: state.hours,
                  digitMinutes: state.minutes,
                  digitSeconds: state.seconds,
                  started: state.started,
                ),
                const SizedBox(height: 50),
                PulsatingButton(
                  started: state.started,
                  onPlay: cubit.start,
                  onPause: cubit.pause,
                ),
                const SizedBox(height: 20),
                ResetButton(
                  visible: (state.hours != "00" || state.minutes != "00" || state.seconds != "00"),
                  onReset: cubit.reset,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



