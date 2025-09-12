// import 'dart:async';



// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:nova/injectable.dart';

// import '../../../domain/entities/app_user.dart';
// import '../../../services/local_storage/token_local_storage.dart';
// import '../model/app_model.dart';

// part 'app_bloc.freezed.dart';

// part 'app_event.dart';
// part 'app_state.dart';

// @singleton
// class AppBloc extends Bloc<AppEvent, AppState> {
//   final TokenLocalStorage _localStorageService;

//   AppBloc({TokenLocalStorage? localStorageService})
//     : _localStorageService = localStorageService ?? getIt(),
//       super(const AppState.initial()) {
//     on<AppEvent>((event, emit) async {
//       await switch (event) {
//         _LogOutEvent() => _logOut(emit),
//         _AuthenticateUserEvent(:final authData) => _authenticateUser(authData, emit),
//         _DeleteUserEvent(:final user) => _deleteUser(user, emit),
//         _UpdateUserEvent(:final user) => _updateUser(user, emit),
//       };
//     });
//   }

//   final StreamController<AppUser?> _userController = StreamController<AppUser?>();

//   Stream<AppUser?> get userStream => _userController.stream;

//   AppUser? get user => state.model.user;

//   _deleteUser(AppUser? user, Emitter<AppState> emit) {
//     emit(AppUserStateChanged(state.model.copyWith(user: null)));
//   }

//   _updateUser(AppUser? user, Emitter<AppState> emit) {
//     emit(AppUserStateChanged(state.model.copyWith(user: user)));
//   }

//   _authenticateUser(AuthSuccessModel authData, Emitter<AppState> emit) async {
//     emit(AppUserStateChanged(state.model.copyWith(user: authData.user)));
//     await _localStorageService.storeToken(token: authData.token, refreshToken: authData.refreshToken);
//   }

//   _logOut(Emitter<AppState> emit) {
//     _localStorageService.deleteToken();
//     emit(AppUserStateChanged(state.model.copyWith(user: null)));
//   }
// }
