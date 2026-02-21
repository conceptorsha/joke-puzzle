import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final staticStringProvider = Provider((Ref ref) {
  return "hello  World";
});
final intProvider = Provider((Ref ref) {
  return 20;
});
class ProviderTest extends ConsumerWidget {
  const ProviderTest({super.key});

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final result = ref.watch(staticStringProvider);
    final resultInt = ref.watch(intProvider);

    return Scaffold(
body: Center(
  child: Text(result + resultInt.toString() ),
)
    );
  }
}
