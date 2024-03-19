class AppConfig {
  //dev urls
  static String devUrl = 'https://studyappmw.luminartechnohub.com/api/v1';
  // static String mediadevUrl = 'https://studyappmw.dev.luminartechnohub.com';

  // produciton urls

  // Todo

// Final urls
  static String baseUrl = devUrl;
  // static String mediaBaseUrl = mediadevUrl;

  /// Shared pref Keys
  static const String ACCESS = 'access';
  static const String REFRESH_ACCESS = 'refreshAccess';
  static const String LOCAL = 'local';
  //signIn response data saved to shared pref
  static const String LOGIN_DATA = 'logInData';
  static const String STUDENT_PHONE_NUMBER = 'studentPhoneNumber';

  // guest data
  static const String GUEST_PHONENUMBER = 'guestPhoneNumber';

  // for aws for dev
  static const awsAccessKey = 'AKIA2SY2WDVB75MEWYOG';
  static const awsSecretKey = '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';
  static const awsBucket = 'studyapp-dev-luminar';
  static const awsRegion = 'us-east-1';
  static const awsDirectory = 'profilepic';
}
