class AppUrls {

  static String protocol = "https";
  static String domain = "seedswild.exarth.com";
  static String root = "$protocol://$domain/";
  static String api = "${root}api/";

  static String accountsAppBase = "${api}accounts/";
  static String signIn = accountsAppBase + "auth/login/";
  static String signUp = accountsAppBase + "auth/registration/";
  static String passwordChange = accountsAppBase + "auth/password/change/";
  static String passwordReset = accountsAppBase + "auth/password/reset/";
  static String profile = "${accountsAppBase}auth/user/";
  static String notifications = "${root}inbox/notifications/api/unread_list/";

  static String v1AppBase = "${api}v1/";
  static String home = "${api}v1/home/";
  static String product = "${api}v1/product/";

  static String productCategory = "${v1AppBase}product/category/";
  static String productHome = "${v1AppBase}";

}
