import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final toggleProvider = StateProvider<bool>((ref) => true);

class ToggleSwitchView extends ConsumerWidget {
  const ToggleSwitchView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFlag = ref.watch(toggleProvider);
    return Center(
      child: IconButton(
        onPressed: () => ref.read(toggleProvider.notifier).state = !isFlag,
        icon: Icon((isFlag) ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
