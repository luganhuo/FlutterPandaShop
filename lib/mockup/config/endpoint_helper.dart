import 'package:pandashop/mockup/constants/constant_endpoints.dart';

import 'obfuscator.dart';

/* 目前只是用product版本的endpoints, sorry.*/
class EndpointHelper {
  static String clientId() => Obfuscator.apiClientID();

  static String clientSecret() => Obfuscator.apiClientSecret();

  static String apiURL() => EndpointProduct.kProductionApiURL;

  static String authURL() => EndpointProduct.kProductionAuthURL;

  static String cmsURL() => EndpointProduct.kProductionCMSURL;

  static String contentApiURL() => EndpointProduct.kProductionContentApiURL;

  static String fabsURL() => EndpointProduct.kProductionFabsURL;

  static String marketingApiURL() => EndpointProduct.kProductionMarketingApiURL;

  static String paymentsApiURL() => EndpointProduct.kProductionPaymentsApiURL;

  static String chinaChannelApiURL() => EndpointProduct.kProductionChinaChannelApiURL;

  static String overriddenContentApiURL() => EndpointProduct.kProductionContentApiURL;

  static String overriddenContentApiAuthURL() => EndpointProduct.kProductionAuthURL;

  static bool isCMSPreview() => false;
}
