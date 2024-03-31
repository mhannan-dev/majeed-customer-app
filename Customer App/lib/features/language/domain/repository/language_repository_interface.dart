import 'package:fodoq/features/address/domain/models/address_model.dart';
import 'package:fodoq/interface/repository_interface.dart';
import 'package:flutter/material.dart';

abstract class LanguageRepositoryInterface extends RepositoryInterface {
  AddressModel? getAddressFormSharedPref();
  void updateHeader(AddressModel? addressModel, Locale locale);
  Locale getLocaleFromSharedPref();
  void saveLanguage(Locale locale);
}
