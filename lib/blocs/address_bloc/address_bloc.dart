import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_buy/blocs/address_bloc/address_event.dart';
import 'package:share_buy/blocs/address_bloc/address_state.dart';
import 'package:share_buy/models/address/address_model.dart';
import 'package:share_buy/models/address/district_model.dart';
import 'package:share_buy/models/address/province_model.dart';
import 'package:share_buy/models/address/ward_model.dart';
import 'package:share_buy/repositories/address_repository.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressState()) {
    on<EventLoadingAddress>(_loading);
    on<EventSelectAddress>(_selectAddress);
    on<EventLoadingAddAddress>(_loadingAddAddress);
    on<EventFindDistrictByProvinceId>(_findDistrictByProvinceId);
    on<EventFindWardByDistrictId>(_findWardByDistrictId);
    on<EventAddAddress>(_addAddress);
  }

  Future<void> _loading(EventLoadingAddress event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      List<AddressModel> addresses = await AddressRepository().getAllByUserId();
      emit(state.copyWith(isLoading: false, addresses: addresses));
    } catch (e) {
      log("Error when get api address by user id: $e");
      emit(state.copyWith(isLoading: false));
    }
  }

  void _selectAddress(EventSelectAddress event, Emitter emit) {
    emit(state.copyWith(selectedAddress: event.address));
  }

  void _loadingAddAddress(EventLoadingAddAddress event, Emitter emit) async {
    try {
      List<ProvinceModel> provinces =
          await AddressRepository().getAllProvince();
      emit(state.copyWith(provinces: provinces));
    } catch (e) {
      log("Error when get all province: $e");
    }
  }

  void _findDistrictByProvinceId(
      EventFindDistrictByProvinceId event, Emitter emit) async {
    try {
      List<DistrictModel> districts = await AddressRepository()
          .getAllDistrictByProvinceId(event.provinceId);
      emit(state.copyWith(districts: districts));
    } catch (e) {
      log("Error when get all district by province id: $e");
    }
  }

  void _findWardByDistrictId(
      EventFindWardByDistrictId event, Emitter emit) async {
    try {
      List<WardModel> wards =
          await AddressRepository().getAllWardByDistrictId(event.districtId);
      emit(state.copyWith(wards: wards));
    } catch (e) {
      log("Error when get all ward by district id: $e");
    }
  }

  void _addAddress(EventAddAddress event, Emitter emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      bool isSuccess = await AddressRepository().addAddress(event.address);
      if (event.isDefault) {
        await AddressRepository().updateDefaultAddress(event.address.id);
      }
      emit(state.copyWith(isLoading: false, isSuccessAddAddress: isSuccess));
    } catch (e) {
      log("Error when add address: $e");
      emit(state.copyWith(isLoading: false));
    }
  }
}
