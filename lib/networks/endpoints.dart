// ignore_for_file: constant_identifier_names

const String url = "https://lsebert.reigeeky.com";
const String imageUrl = "$url/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway(String orderId) =>
      "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
}

final class Endpoints {
  Endpoints._();

//in use
  static String signUp() => "/api/register";
  static String logIn() => "/api/login";
  static String verifyOtpCode() => "/api/verify-otp-password";
  static String forgotPassword() => "/api/forget-password";
  static String resendOtp() => "/api/resend-otp";
  static String logout() => "/api/logout";
  static String questions() => "/api/pro-questions";
  static String occupationQuestions() => "/api/occupations";
  static String answers() => "/api/pro-answers";
  static String proPrfofile() => "/api/pro-user-info";
  static String proProfileUpdate() => "/api/pro-update-user-info";
  static String proBioUpdate() => "/api/change-bio-current-job-info";
  static String proOtherSkill() => "/api/change-key-skill-info";
  static String proExperinaceEdit(int id) => "/api/my-experence/edit/$id";
  static String deleteExperiance(int id) => "/api/my-experence/delete/$id";
  static String addNewExperiance() => "/api/my-experence";
  static String personalInfo() => "/api/change-additional-info";
  static String postIssues() => "/api/ticket-store";
  static String getPendingTicketList() => "/api/tickets/pending-list";
  static String getResolvedTicketList() => "/api/tickets/resolved-list";
  static String getTicketDetails(int id) => "/api/tickets/$id/details";
  static String postTicketReplay() => "/api/pro-ticket-reply";
  static String postChangePass() => "/api/change-password";
  static String getExperiance() => "/api/my-experence";
  static String proImages() => "/api/pro-images";
  static String proImagesDelete() => "/api/pro-images-delete";

  ///=================<<<<<<<<<>>>>>>>>>>>>>==========================
  ///<><><><><><>===========<><><><>===============<><><><>===========
  //trade api end point

  static String tradeProfile() => "/api/trade/my-profile";
  static String tradeEditProfile() => "/api/trade/update-profile";
  static String tradeDashboard() => "/api/trade/pro-profile-list";
  static String proProfileData(int id) => "/api/trade/pro-profile/$id";
  static String getNotification() => "/api/my-notifications";
  

  //backend_url
  static String appCategories() => "/api/product-categories";
  static String allShopCategories() => "/api/shop-categories";
  static String getShopByCategories(String slug) =>
      "/api/shop-categories/$slug/";
  static String allShops(double lat, double lng) =>
      "/api/shops?lat=$lat&lng=$lng";
  static String searchShops() => "/api/filter-shops";

  static String socialLogin() => "/api/social-login";

  static String allShopSubCategories() => "/api/shop-sub-categories";
  static String shopDetails(String slug) => "/api/shops/$slug";
  static String productDetails(String slug) => "/api/products/$slug";
  static String shopsProductCategories() => "/api/product-categories";
  static String shopProducts(String slug) => "/api/shops/$slug/products";
  static String orders() => "/api/orders";
  static String allOrders() => "/api/all-orders";
  static String reOrders() => "/api/re-order";
  static String ordersOngoing() => "/api/orders-ongoing";
  static String orderDetail(String orderId) => "/api/orders/$orderId";
  static String profile() => "/api/profile";
  static String deliveryAddresses() => "/api/v2/delivery-addresses";
  static String deleteDeliveryAddress(int id) => "/api/delivery-addresses/$id";
  static String saveDeliveryAddress() => "/api/save-delivery-address";
  static String updateAddress() => "/api/update-address";

  static String defaultDeliveryAddress() => "/api/default-delivery-address";
  static String updateProfile() => "/api/update-profile";
  static String carts() => "/api/carts";
  static String addToCart() => "/api/carts";
  static String deleteCartItem() => "/api/carts";
  static String addMultipleAddon() => "/api/cart-addons-multiple";
  static String paymentMethods() => "/api/payment-methods";
  static String timeSlots(String slug) => "/api/shops/$slug/time-slots";

  static String resetPassword() => "/api/reset-password";
  static String changePassword() => "/api/change-password";
  static String sliders() => "/api/sliders";
  static String sendMailToAdmin() => "/api/send-mail-to-admin";
  static String adminSettings() => "/api/admin-settings";
  static String trendingFood() => "/api/trending-food";
  static String deviceToken() => "/api/device-token";
  static String deleteAccount() => "/api/delete-account";
  static String deleteToken() => "/api/delete-device-token";
  static String productRating() => "/api/product-rating";
  static String applyVoucher() => "/api/apply-voucher";
  static String reviews() => "/api/reviews";
  static String removeVoucher() => "/api/remove-voucher";
  static String getCartRestaurant() => "/api/cart-restaurant";
  static String getFavouriteRestaurant() => "/api/favourite-restaurants";
  static String makeFavouriteRestaurant() => "/api/favourite-restaurant";
  static String getDefaultDeliveryAddress() =>
      "/api/get-default-delivery-address";
  static String getProductByCategory(String slug) =>
      "/api/product-categories/$slug/products";
  static String getSubCategoryByCategory(String slug) =>
      "/api/shop-categories/$slug/subs";
  static String postCancelOrder() => "/api/order-cancel";
  static String getDeliveryAddressCategory() =>
      "/api/delivery-address-categories";
  static String getCartProcessingTime(num time, num id) =>
      "/api/cart-food-processing-time?duration=$time&restaurant_id=$id";
  static String getFilteredProduct() => "/api/filter-products";

  //gloabal url
  static String gDistanceApi() =>
      "https://maps.googleapis.com/maps/api/distancematrix/json?origins=";
  static String successfulPaymentUrlPrefix() =>
      "https://wedeapp.eu/payment-success";
  static String failedPaymentUrlPrefix() => "https://wedeapp.eu/payment-fail";
  static String paymentUrlProcessing() =>
      "https://wedeapp.eu/payment-processing";
}
