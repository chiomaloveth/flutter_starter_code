enum ErrorCode {
  //Get User
  userNotSignedIn,
  agreeToTerms,

  // Create Account
  usernameAlreadyInUse,
  userWithEmailAlreadyExist,

  //Forgot Password
  userWithEmailNotFound,

  // Delete Account
  userNeedsToReLogin, // Error requiring recent login. User needs to re-login to delete account.
  // Sign In
  invalidCredentials,
  logInFailed,
  logInCancelled,
  emailNotVerified,
  createAccountFailed,

  // General
  entityNotFound,
  emptyResponse,
  serverError,
  networkError,
  unknownError,

  //Image Picker
  couldNotPickImage,

  //Video Picker
  couldNotPickVideo,

  cancelPickMedia,

  //Reset password
  userNotLoggedIn,
  incorrectPassword,
  weakPassword,

  // Verify Email + OOB Action
  invalidActionCode,
  expiredActionCode,
  userDisabled,
  userNotFound,

  //link with password
  providerAlreadyLinked,

  // Storage Encoding & Decoding
  missingDecoder,
  missingEncoder,

  //Upload to Firebase
  errorUploadingFile,

  //Get Notifications
  errorGettingNotifications,

  //Coming soon
  comingSoon,
  cannotSelectAudio,
  cannotSelectDocument,

  cannotLoadLocales,
  cannotSwitchLocale,
}
