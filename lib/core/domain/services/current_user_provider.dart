import '../../data/config/types.dart';
import '../entities/app_user.dart';

abstract class CurrentUserProvider {
  AppUser? get currentUser;
  Id? get currentUserId => currentUser?.id;
}
