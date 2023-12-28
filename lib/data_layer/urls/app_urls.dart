class AppUrls {

  static String base = "https://seedswild.exarth.com/api/";
  static String accountsAppBase = "${base}accounts/";
  static String signIn = accountsAppBase + "auth/login/";
  static String signUp = accountsAppBase + "auth/registration/";
  static String passwordChange = accountsAppBase + "auth/password/change/";
  static String passwordReset = accountsAppBase + "auth/password/reset/";
  static String profile = "${accountsAppBase}auth/user/";

  static String v1AppBase = "${base}v1/";
  static String home = "${base}v1/home/";
  static String product = "${base}v1/product/";

  static String productCategory = "${v1AppBase}product/category/";
  static String productHome = "${v1AppBase}";

}
