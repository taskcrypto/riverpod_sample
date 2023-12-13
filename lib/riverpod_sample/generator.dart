import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generator.g.dart';

//  ターミナルでコードジェネレータの起動 watchをつけることで継続的に動作する
//  generator.g.dartが動的に生成される
//  flutter pub run build_runner watch

//  isPlayerToggleProviderを生成する
//  生成されるProviderの名前はクラス名+Providerで頭文字は小文字になる
@riverpod
class IsPlayerToggle extends _$IsPlayerToggle {
  @override
  bool build() => true;

  void simpleToggle() {
    //stateに新しいデータを渡すことで更新する
    state = !state;
  }

  void toggle() {
    final newState = !state;
    if (newState) {
      debugPrint('[toggle]PLAY');
    } else {
      debugPrint('[toggle]STOP');
    }
    state = newState;
  }

  void change({required bool newState}) {
    if (newState) {
      debugPrint('[change]PLAY');
    } else {
      debugPrint('[change]STOP');
    }
    state = newState;
  }
}

class ToggleSwitchGeneratorView extends ConsumerWidget {
  const ToggleSwitchGeneratorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFlag = ref.watch(isPlayerToggleProvider);
    return Center(
      child: IconButton(
        onPressed: () => ref.read(isPlayerToggleProvider.notifier).toggle(),
        // onPressed: () => ref.read(isPlayerToggleProvider.notifier).change(newState: !isFlag),
        icon: Icon((isFlag) ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
