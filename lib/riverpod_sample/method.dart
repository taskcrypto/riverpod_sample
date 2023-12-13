import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final toggleSNP = StateNotifierProvider<ToggleSN, bool>((ref) => ToggleSN());

class ToggleSN extends StateNotifier<bool> {
  ToggleSN() : super(true) {
    //superには初期値を渡す
    soundPlayerInit(); //初期化処理が必要な場合は中かっこの中にやりたいことを書く
  }

  void soundPlayerInit() async {
    //音楽プレーヤーを期化したりする
    state = true;
    soundControl();
  }

  void toggle() {
    state = !state;
    soundControl();
  }

  void change({required bool flag}) {
    state = flag;
    soundControl();
  }

  void soundControl() {
    if (state == true) {
      debugPrint('[soundControl]PLAY');
    } else {
      debugPrint('[soundControl]STOP');
    }
  }
}

class ToggleSwitchByMethodView extends ConsumerWidget {
  const ToggleSwitchByMethodView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFlag = ref.watch(toggleSNP);
    return Center(
      child: IconButton(
        onPressed: () => ref.read(toggleSNP.notifier).toggle(),
        icon: Icon((isFlag) ? Icons.play_arrow : Icons.pause),
      ),
    );
  }
}
