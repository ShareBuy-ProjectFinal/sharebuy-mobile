import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/address/district_model.dart';
import 'package:share_buy/models/address/province_model.dart';
import 'package:share_buy/models/address/ward_model.dart';
import 'package:share_buy/models/user/user_model.dart';
import 'package:share_buy/repositories/auth_repository.dart';

class AddressRepository extends FetchClient {
  Future<List<AddressModel>> getAllByUserId() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/users/addresses/user/${AuthBloc.currentUser?.id ?? ''}');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<AddressModel> addresses = [];
        for (var element in data) {
          addresses.add(AddressModel.fromJson(element));
        }
        return addresses;
      } else {
        return [];
      }
    } catch (e) {
      log("Error repository when get api address by user id: $e");
      return [];
    }
  }

  Future<List<ProvinceModel>> getAllProvince() async {
    try {
      final Response<dynamic> response =
          await super.getData(path: '/api/users/addresses/province/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<ProvinceModel> provinces = [];
        for (var element in data) {
          provinces.add(ProvinceModel.fromJson(element));
        }
        return provinces;
      } else {
        return [];
      }
    } catch (e) {
      log('Error repository when get all province: $e');
      return [];
    }
  }

  Future<List<DistrictModel>> getAllDistrictByProvinceId(num provinceId) async {
    try {
      final Response<dynamic> response = await super
          .getData(path: '/api/users/addresses/district/province/$provinceId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<DistrictModel> provinces = [];
        for (var element in data) {
          provinces.add(DistrictModel.fromJson(element));
        }
        return provinces;
      } else {
        return [];
      }
    } catch (e) {
      log('Error repository when get all district: $e');
      return [];
    }
  }

  Future<List<WardModel>> getAllWardByDistrictId(num districtId) async {
    try {
      final Response<dynamic> response = await super
          .getData(path: '/api/users/addresses/ward/district/$districtId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<WardModel> provinces = [];
        for (var element in data) {
          provinces.add(WardModel.fromJson(element));
        }
        return provinces;
      } else {
        return [];
      }
    } catch (e) {
      log('Error repository when get all district: $e');
      return [];
    }
  }

  Future<bool> addAddress(AddressModel address) async {
    try {
      final Response<dynamic> response =
          await super.postData(path: '/api/users/addresses', params: {
        "user_id": AuthBloc.currentUser?.id,
        "province": address.province?.id,
        "district": address.district?.id,
        "ward": address.ward?.id,
        "detail": address.detail,
        "phone_number": address.phoneNumber,
        "region": {
          "latitude": address.region?.latitude ?? 10.783935,
          "longitude": address.region?.longitude ?? 106.69128
        }
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error repository when add address: $e');
      return false;
    }
  }

  Future<void> updateDefaultAddress(String? id) async {
    try {
      await AuthRepository()
          .updateProfile(user: UserModel(address: AddressModel(id: id)));
    } catch (e) {
      log('Error repository when update default address: $e');
    }
  }
}
