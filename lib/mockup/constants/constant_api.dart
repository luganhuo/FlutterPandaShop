class APIConstants {
  static const String kAPIVersion = "v1";

  static const String kOAuth2AuthorizationPath = "connect/authorize";
  static const String kOAuth2TokenPath = "connect/token";
  static const String kOAuth2RevokePath = "connect/revocation";
  static const String kOAuth2UserInfoPath = "connect/userinfo";

  static const String kAddressSchemaApiEndPoint = "addressSchemas/%@";

  static const String kBagApiEndPoint = "bags/%@";
  static const String kBagItemApiEndPoint = "bags/%@/items/%@";
  static const String kBagItemsApiEndPoint = "bags/%@/items";
  static const String kBagMergeApiEndPoint = "bags/%@/merge/%@";
  static const String kBagCheckoutOrdersApiEndPoint = "bags/%@/checkoutOrders";

  static const String kBrandsApiEndPoint = "brands";
  static const String kBrandApiEndPoint = "brands/%@";

  static const String kCategoriesApiEndPoint = "categories";
  static const String kCategoriesChildApiEndPoint = "categories/%@/children";
  static const String kCategoriesTopApiEndPoint = "categories/top";
  static const String kCategoryApiEndPoint = "categories/%@";

  static const String kCheckoutOrderApiEndPoint = "checkoutOrders/%@";
  static const String kCheckoutPromoCodeApiEndPoint = "checkoutOrders/%@/promocodes?code=%@";
  static const String kCheckoutPromoCodeDeleteApiEndPoint = "checkoutOrders/%@/promocodes/%@";
  static const String kCheckoutOrderShippingOptionsApiEndPoint = "checkoutOrders/%@/shippingOptions";
  static const String kCheckoutOrderTagsApiEndpoint = "checkoutOrders/%@/tags";
  static const String kCheckoutOrderItemTagsApiEndpoint = "checkoutOrders/%@/items/%@/tags";

  static const String kCitiesApiEndPoint = "cities";
  static const String kCityApiEndPoint = "cities/%@";

  static const String kConfiguratorTaxDutiesSettingApiEndPoint = "configurator/taxDuties/%@";

  static const String kContinentsApiEndPoint = "continents";

  static const String kCountriesApiEndPoint = "countries";
  static const String kCountryApiEndPoint = "countries/%@";
  static const String kCountryCurrencyApiEndPoint = "countries/%@/currency";
  static const String kCountryStatesApiEndPoint = "countries/%@/states";
  static const String kCountryZipCodesApiEndPoint = "countries/%@/zipCodes/%@";

  static const String kCurrenciesApiEndPoint = "currencies";
  static const String kCurrencyApiEndPoint = "currencies/%@";

  static const String kDeliveryMethodsApiEndpoint = "deliveryMethods";

  static const String kExchangesApiEndpoint = "exchanges";

  static const String kGuestUserApiEndPoint = "guestUsers/%@";
  static const String kGuestUsersApiEndPoint = "guestUsers";

  static const String kGuestUserBenefitsApiEndPoint = "guestUsers/%@/benefits";

  static const String kMerchantsApiEndPoint = "merchants";
  static const String kMerchantApiEndPoint = "merchants/%@";
  static const String kMerchantLocationsApiEndPoint = "merchants/%@/locations";

  static const String kMerchantsLocationsApiEndPoint = "merchantsLocations";
  static const String kMerchantsLocationsNearMeApiEndPoint = "merchantsLocations/nearMe";

  static const String kOrderApiEndPoint = "orders/%@";
  static const String kOrderReturnsApiEndPoint = "orders/%@/returns";

  static const String kPersonalShopperApiEndPoint = "personalShoppers/%@";

  static const String kProductApiEndPoint = "products/%@";
  static const String kProductVariantsMeasurementsApiEndPoint = "products/%@/variantsMeasurements";
  static const String kProductOutfitsApiEndPoint = "products/%@/outfits";

  static const String kReturnsApiEndPoint = "returns";
  static const String kReturnApiEndPoint = "returns/%@";
  static const String kReturnPickupCapabilityApiEndPoint = "returns/%@/pickupCapabilities/%@";

  static const String kSearchApiEndPoint = "search/products";
  static const String kSearchFacetsApiEndPoint = "search/products/facets";
  static const String kSearchSuggestionApiEndPoint = "search/suggestions";
  static const String kSearchStopWordApiEndPoint = "search/stopwords";

  static const String kSetApiEndPoint = "sets/%@";
  static const String kSetItemsApiEndPoint = "sets/%@/items";
  static const String kSizeGuidesEndPoint = "sizeGuides";

  static const String kStateApiEndPoint = "states/%@";
  static const String kStatesApiEndPoint = "states";

  static const String kStateCitiesApiEndPoint = "states/%@/cities";

  static const String kTenantMeApiEndPoint = "tenants/me";
  static const String kTenantOptionsApiEndPoint = "tenants/%@/options";

  static const String kUserAddressesCreateApiEndPoint = "users/%@/addresses";
  static const String kUserAddressesCreateApiWithClientIdEndPoint = "users/%@/addresses?clientId=%@";
  static const String kUserAddressesApiEndPoint = "users/%@/addresses";
  static const String kUserAddressApiEndPoint = "users/%@/addresses/%@";
  static const String kUserAddressApiWithClientIdEndPoint = "users/%@/addresses/%@?clientId=%@";
  static const String kUserAddressesShippingCurrentApiEndPoint = "users/%@/addresses/shipping/current";
  static const String kUserAddressesBillingCurrentApiEndPoint = "users/%@/addresses/billing/current";
  static const String kUserAddressesDefaultShippingApiEndPoint = "users/%@/addresses/shipping/%@";
  static const String kUserAddressesDefaultBillingApiEndPoint = "users/%@/addresses/billing/%@";

  static const String kUserPasswordRecoveryApiEndPoint = "users/password-recovery";
  static const String kUserPasswordResetEndPoint = "users/password-reset";
  static const String kUserPasswordChangeApiEndPoint = "users/%@/password-change";

  static const String kUserApiEndPoint = "users/%@";
  static const String kUserMeApiEndPoint = "users/me";
  static const String kUsersApiEndPoint = "users";

  static const String kUserBenefitsApiEndPoint = "users/%@/benefits";

  static const String kUserOrdersApiEndPoint = "users/%@/orders";

  static const String kUserPreferencesApiEndPoint = "users/%@/preferences";

  static const String kWishlistApiEndPoint = "wishlists/%@";
  static const String kWishlistItemApiEndPoint = "wishlists/%@/items";
  static const String kWishlistItemsApiEndPoint = "wishlists/%@/items/%@";
  static const String kWishlistMergeApiEndPoint = "wishlists/%@/merge/%@";
}
