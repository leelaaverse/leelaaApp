class AppUrl {
  static String baseUrl = 'https://eyes.winggs.com';

  // static String baseUrl = 'http://192.168.168.101:5500';

  static String userRegister = "/api/auth/register";
  static String userLogin = "/api/auth/login";
  static String sendOtp = "/api/auth/resendOtp";
  static String resetPasswordCall = "/api/auth/resetpassword-with-otp";
  static String verifyOtp = "/api/auth/verifyOtp";

  //

  static String dashBard = "/api/dashboard";
  static String customerListing = "/api/customers/app";
  static String getCustomerListWithPrescription =
      "/api/customers/getCustomerList";
  static String customer = "/api/customers";
  static String createPrescriptions = "/api/prescriptions/createApp";
  static String invoiceListing = "/api/invoices/app";
  static String createInvoice = "/api/invoices";
  static String uploadFile = "/api/files/upload";
  static String userProfile = "/api/users";
}
