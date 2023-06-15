// 途中のコードは省略

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@override
Widget build(BuildContext context, WidgetRef ref){
  // Providerの購読
  ref.listen<int>(
    counterProvider, // 購読対象のProviderを指定
    (previous, next){
      // 処理記載
      if(next.isEven){
        return;
      }
      showDialog(context: context, builder: (context){
        return AlertDialog(title: Text('Oh!!!'),);
      });
    }
    onError: (error, stackTrace) => print('$error'));
}
