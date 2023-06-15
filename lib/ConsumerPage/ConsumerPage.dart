import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConsumerPage'),
      ),
      // Consumerで囲むことで、providerが更新された時にTextWidgetのみが再構築される
      body: Consumer(builder: (context, ref, child) {
        final hoge = ref.watch(provider);
        return Text('$hoge');
      }),
    );
  }
}
