class AppUrl {
  static String baseUrl = 'https://backend.leelaah.com/api';

  // static String baseUrl = 'http://192.168.168.101:5500';

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

  static String userLogin = "/auth/login";
  static String userRegister = "/auth/register";
  static String forgotPassword = "/auth/forgot-password";

  static String generateImage = "/posts/generate-image";
}
