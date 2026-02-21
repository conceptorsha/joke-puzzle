import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
 final counterProvider = StateProvider((Ref ref){
return 0;
 });
class StateProviderTest extends ConsumerWidget {
  const StateProviderTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(

      appBar: AppBar(title: Text("STATE PROVIDER TUTORIAL")),
 floatingActionButton: IconButton(onPressed:(){
   ref.read(counterProvider.notifier).state ++;
 },icon:Icon(Icons.add)),
 body: Center(child: Text(counter.toString())),
    );
  }
}
