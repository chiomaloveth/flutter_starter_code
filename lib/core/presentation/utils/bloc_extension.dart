import 'package:flutter_bloc/flutter_bloc.dart';

extension EmitterExtension<E> on Emitter<E> {
  Future<void> async(E newState) async {
    call(newState);
  }
}
