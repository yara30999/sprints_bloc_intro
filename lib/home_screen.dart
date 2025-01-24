import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sprints_bloc_intro/bloc/counter_bloc/counter_bloc.dart';
import 'package:sprints_bloc_intro/bloc/theme_bloc/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Counter screen'),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 7 || state.counter == -7) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Counter reached ${state.counter}  :)'),
              ),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  'Counter Value: ${state.counter}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.filled(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    icon: Icon(Icons.add)),
                IconButton.filled(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    icon: Icon(Icons.remove)),
              ],
            ),
            const SizedBox(height: 40),
            BlocConsumer<ThemeBloc, ThemeState>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.themeData.toString()} turned on :)'),
                  ),
                );
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                  child: Text('Toggle Theme'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
