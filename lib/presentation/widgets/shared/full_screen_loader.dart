import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading Breeds',
      'Wait a second',
      'Converting data',
      'Almost there',
      'Loading.....'
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Please be patient',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading...', style: TextStyle(fontSize: 20));
              }
              return Text(snapshot.data!, style: const TextStyle(fontSize: 20));
            })
      ]),
    );
  }
}
