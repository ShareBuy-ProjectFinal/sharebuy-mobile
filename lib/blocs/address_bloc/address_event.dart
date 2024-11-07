import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/address/district_model.dart';
import 'package:share_buy/models/address/province_model.dart';
import 'package:share_buy/models/address/region_model.dart';
import 'package:share_buy/models/address/ward_model.dart';

class AddressEvent {}

class EventLoadingAddress extends AddressEvent {}

class EventSelectAddress extends AddressEvent {
  final AddressModel address;

  EventSelectAddress(this.address);
}

class EventLoadingAddAddress extends AddressEvent {}

class EventFindDistrictByProvinceId extends AddressEvent {
  final num provinceId;

  EventFindDistrictByProvinceId(this.provinceId);
}

class EventFindWardByDistrictId extends AddressEvent {
  final num districtId;

  EventFindWardByDistrictId(this.districtId);
}

class EventAddAddress extends AddressEvent {
  final String name;
  final String phone;
  final String detail;
  final ProvinceModel province;
  final DistrictModel district;
  final WardModel ward;
  final RegionModel region;
  final bool isDefault;
  final AddressModel address;

  EventAddAddress({
    required this.name,
    required this.phone,
    required this.detail,
    required this.province,
    required this.district,
    required this.ward,
    required this.region,
    required this.isDefault,
  }) : address = AddressModel(
          // name: name,
          phoneNumber: phone,
          detail: detail,
          province: province,
          district: district,
          ward: ward,
          region: region,
        );
}
