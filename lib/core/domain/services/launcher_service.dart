abstract class LauncherService {
  /// This is to open the url in the browser
  Future<bool> launchUrl(String url);

  /// This is to open the email app to see messages
  Future<bool> openDefaultEmailApp();

  /// This is to open the email app to compose a new email
  Future<bool> launchNewEmptyEmail();

  /// This is to open the email app to compose a new email with the email address, subject and body
  Future<bool> launchEmail(String emailAddress, {String? subject, String? body});
}
