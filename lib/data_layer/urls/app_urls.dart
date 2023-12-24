class AppUrls {
  // ACCOUNTS API'S.............................................................
  static var base = "http://192.168.18.13:8000/api/";
  static var accountsAppBase = "${base}accounts/";
  static var signIn = accountsAppBase + "auth/login/";
  static var signUp = accountsAppBase + "auth/registration/";
  static var passwordChange = accountsAppBase + "auth/password/change/";

  // VERSION1 API'S.............................................................
  static var v1AppBase = "${base}v1/";
  static var home = "${base}v1/home/";

  static var profile = "${accountsAppBase}auth/user/";

  static var productCategory = "${v1AppBase}product/category/";
  static var productHome = "${v1AppBase}";
  static var product = "${v1AppBase}";
}
