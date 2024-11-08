import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:share_buy/application/theme/app_colors.dart';
import 'package:share_buy/application/theme/app_typography.dart';
import 'package:share_buy/blocs/address_bloc/address_bloc.dart';
import 'package:share_buy/blocs/address_bloc/address_event.dart';
import 'package:share_buy/blocs/address_bloc/address_state.dart';
import 'package:share_buy/models/address/district_model.dart';
import 'package:share_buy/models/address/province_model.dart';
import 'package:share_buy/models/address/region_model.dart';
import 'package:share_buy/models/address/ward_model.dart';
import 'package:share_buy/widgets/address_select/children/text_field_address_custom.dart';
import 'package:share_buy/widgets/component/custom_button.dart';

class AddressAdd extends StatefulWidget {
  const AddressAdd({super.key});

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerNumberPhone = TextEditingController();

  final TextEditingController _controllerProvince = TextEditingController();
  final TextEditingController _controllerDistrict = TextEditingController();
  final TextEditingController _controllerWard = TextEditingController();
  final TextEditingController _controllerStreet = TextEditingController();

  final FocusNode _focusNodeProvince = FocusNode();
  final FocusNode _focusNodeDistrict = FocusNode();
  final FocusNode _focusNodeWard = FocusNode();
  final FocusNode _focusNodeStreet = FocusNode();

  ProvinceModel selectedProvince = ProvinceModel();
  DistrictModel selectedDistrict = DistrictModel();
  WardModel selectedWard = WardModel();

  bool isDefault = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddressBloc>().add(EventLoadingAddAddress());

    _focusNodeProvince.addListener(_onFocusChangeProvince);
    _focusNodeDistrict.addListener(_onFocusChangeDistrict);
    _focusNodeWard.addListener(_onFocusChangeWard);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _focusNodeProvince.removeListener(_onFocusChangeProvince);
    _focusNodeProvince.dispose();
    _controllerProvince.dispose();

    _focusNodeDistrict.removeListener(_onFocusChangeDistrict);
    _focusNodeDistrict.dispose();
    _controllerDistrict.dispose();

    _focusNodeWard.removeListener(_onFocusChangeWard);
    _focusNodeWard.dispose();
    _controllerWard.dispose();

    _focusNodeStreet.dispose();
    _controllerStreet.dispose();
  }

  void _onFocusChangeProvince() {
    if (!_focusNodeProvince.hasFocus) {
      _controllerProvince.text = selectedProvince.provinceName ?? "";
    }
  }

  void _onFocusChangeDistrict() {
    if (!_focusNodeDistrict.hasFocus) {
      _controllerDistrict.text = selectedDistrict.districtName ?? "";
    }
  }

  void _onFocusChangeWard() {
    if (!_focusNodeWard.hasFocus) {
      _controllerWard.text = selectedWard.wardName ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (BuildContext context, AddressState state) {
        if (state.isLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.white,
          title: const Text('Thêm địa chỉ mới'),
        ),
        body: SafeArea(
          child:
              BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
            log('provinces ${state.provinces?.length}');
            log('districts ${state.districts!.isNotEmpty ? state.districts?.first.province : ""} : ${selectedProvince.id}');
            // log('initState ${state.wards?[0].id} ${selectedDistrict.id}');
            log('wards ${state.wards!.isNotEmpty ? state.wards?.first.district : ""} : ${selectedDistrict.id}');
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        decoration: const BoxDecoration(
                            color: AppColors.backgroundGrey),
                        child: Text(
                          'Liên hệ',
                          style: AppTypography.primaryBlack,
                        ),
                      ),
                      TextFieldAddressCustom(
                          hintText: 'Họ và tên', controller: _controllerName),
                      TextFieldAddressCustom(
                          hintText: 'Số điện thoại',
                          controller: _controllerNumberPhone),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        decoration: const BoxDecoration(
                            color: AppColors.backgroundGrey),
                        child: Text(
                          'Địa chỉ',
                          style: AppTypography.primaryBlack,
                        ),
                      ),
                      TypeAheadField<ProvinceModel>(
                        controller: _controllerProvince,
                        focusNode: _focusNodeProvince,
                        itemBuilder: (context, province) {
                          return ListTile(
                            tileColor: province.id == selectedProvince.id
                                ? AppColors.lightBlue
                                : Colors.white,
                            title: Text(province.provinceName ?? ""),
                          );
                        },
                        builder: (context, controller, focusNode) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: 'Tỉnh/Thành phố',
                              hintStyle: AppTypography.hintTextStyle,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                            ),
                          );
                        },
                        onSelected: (province) {
                          if (province.id == selectedProvince.id) {
                            _focusNodeProvince.nextFocus();
                            return;
                          }
                          selectedProvince = province;
                          _controllerProvince.text =
                              province.provinceName ?? "";
                          _controllerDistrict.text = "";
                          selectedDistrict = DistrictModel();
                          _controllerWard.text = "";
                          selectedWard = WardModel();
                          _focusNodeDistrict.requestFocus();
                          context.read<AddressBloc>().add(
                              EventFindDistrictByProvinceId(province.id ?? 0));
                        },
                        suggestionsCallback: (search) {
                          return state.provinces?.getBySearchName(search) ?? [];
                        },
                        emptyBuilder: (context) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: Text(
                                'Không có dữ liệu',
                                style: AppTypography.hintTextStyle,
                              ));
                        },
                        loadingBuilder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Text(
                              'Đang tải dữ liệu',
                              style: AppTypography.hintTextStyle,
                            ),
                          );
                        },
                      ),
                      TypeAheadField<DistrictModel>(
                        controller: _controllerDistrict,
                        focusNode: _focusNodeDistrict,
                        itemBuilder: (context, district) {
                          return ListTile(
                            tileColor: district.id == selectedDistrict.id
                                ? AppColors.lightBlue
                                : Colors.white,
                            title: Text(district.districtName ?? ""),
                          );
                        },
                        builder: (context, controller, focusNode) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: 'Quận/Huyện',
                              hintStyle: AppTypography.hintTextStyle,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                            ),
                          );
                        },
                        onSelected: (district) {
                          selectedDistrict = district;
                          _controllerDistrict.text =
                              district.districtName ?? "";
                          // _focusNodeDistrict.nextFocus();
                          _focusNodeWard.requestFocus();
                          context
                              .read<AddressBloc>()
                              .add(EventFindWardByDistrictId(district.id ?? 0));
                        },
                        suggestionsCallback: (search) {
                          log("suggestionsCallback $search : ${state.districts?.length}");
                          // return state.districts!.getBySearchName(search);
                          return search.isEmpty
                              ? context
                                  .read<AddressBloc>()
                                  .getProductItemsBySearchString(
                                      selectedProvince.id ?? 0)
                              : state.districts?.getBySearchName(search) ?? [];
                        },
                        emptyBuilder: (context) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: Text(
                                'Không có dữ liệu',
                                style: AppTypography.hintTextStyle,
                              ));
                        },
                        loadingBuilder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Text(
                              'Đang tải dữ liệu',
                              style: AppTypography.hintTextStyle,
                            ),
                          );
                        },
                      ),
                      TypeAheadField<WardModel>(
                        controller: _controllerWard,
                        focusNode: _focusNodeWard,
                        itemBuilder: (context, ward) {
                          return ListTile(
                            title: Text(ward.wardName ?? ""),
                          );
                        },
                        builder: (context, controller, focusNode) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              hintText: 'Phường/Xã',
                              hintStyle: AppTypography.hintTextStyle,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                            ),
                          );
                        },
                        onSelected: (ward) {
                          selectedWard = ward;
                          _controllerWard.text = ward.wardName ?? "";
                          _focusNodeStreet.requestFocus();
                          setState(() {});
                        },
                        suggestionsCallback: (search) {
                          return state.wards?.getBySearchName(search) ?? [];
                        },
                        emptyBuilder: (context) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 10.h),
                              child: Text(
                                'Không có dữ liệu',
                                style: AppTypography.hintTextStyle,
                              ));
                        },
                        loadingBuilder: (context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Text(
                              'Đang tải dữ liệu',
                              style: AppTypography.hintTextStyle,
                            ),
                          );
                        },
                      ),
                      TextField(
                        onChanged: (value) {
                          //
                        },
                        controller: _controllerStreet,
                        focusNode: _focusNodeStreet,
                        decoration: InputDecoration(
                          hintText: 'Tên đường, số nhà',
                          hintStyle: AppTypography.hintTextStyle,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        decoration: const BoxDecoration(
                            color: AppColors.backgroundGrey),
                        child: Text(
                          'Cài đặt',
                          style: AppTypography.primaryBlack,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Đặt làm địa chỉ mặc định',
                                style: AppTypography.primaryBlack),
                            Switch(
                                value: isDefault,
                                onChanged: (value) {
                                  setState(() {
                                    isDefault = value;
                                  });
                                })
                          ],
                        ),
                      ),
                      Divider(
                        height: 2.h,
                        thickness: 1.h,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  buttonColor: AppColors.buttonBlue,
                  textColor: AppColors.white,
                  buttonText: 'Hoàn thành',
                  onTap: () {
                    log('Hoàn thành ${_controllerName.text} ${_controllerNumberPhone.text}  ${selectedProvince.provinceName}  ${selectedDistrict.districtName}${selectedWard.wardName} ${_controllerStreet.text} ${isDefault}');
                    // context.read<AddressBloc>().add(EventAddAddress(
                    //     name: _controllerName.text,
                    //     phone: _controllerNumberPhone.text,
                    //     province: selectedProvince,
                    //     district: selectedDistrict,
                    //     ward: selectedWard,
                    //     detail: _controllerStreet.text,
                    //     region: RegionModel(
                    //         latitude: 10.783935, longitude: 106.69128),
                    //     isDefault: isDefault));
                  },
                  disable: _controllerName.text.isEmpty ||
                      _controllerNumberPhone.text.isEmpty ||
                      selectedProvince.id == null ||
                      selectedDistrict.id == null ||
                      selectedWard.id == null ||
                      _controllerStreet.text.isEmpty,
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
