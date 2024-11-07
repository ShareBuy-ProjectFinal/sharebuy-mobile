import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/address/district_model.dart';
import 'package:share_buy/models/address/province_model.dart';
import 'package:share_buy/models/address/ward_model.dart';

class AddressState {
  bool isLoading;
  bool isSuccessAddAddress;

  AddressModel? selectedAddress;
  List<AddressModel> addresses;
  List<ProvinceModel>? provinces;
  List<DistrictModel>? districts;
  List<WardModel>? wards;

  AddressState(
      {this.addresses = const [],
      this.isLoading = false,
      this.provinces = const [],
      this.districts = const [],
      this.wards = const [],
      this.isSuccessAddAddress = false,
      this.selectedAddress});

  AddressState copyWith(
      {List<AddressModel>? addresses,
      List<ProvinceModel>? provinces,
      List<DistrictModel>? districts,
      List<WardModel>? wards,
      bool? isLoading,
      bool? isSuccessAddAddress,
      AddressModel? selectedAddress}) {
    return AddressState(
        addresses: addresses ?? this.addresses,
        provinces: provinces ?? this.provinces,
        districts: districts ?? this.districts,
        wards: wards ?? this.wards,
        selectedAddress: selectedAddress ?? this.selectedAddress,
        isSuccessAddAddress: isSuccessAddAddress ?? this.isSuccessAddAddress,
        isLoading: isLoading ?? this.isLoading);
  }
}
