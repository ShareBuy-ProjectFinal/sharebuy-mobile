import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:share_buy/blocs/auth_bloc/auth_bloc.dart';
import 'package:share_buy/helper/network/http_client.dart';
import 'package:share_buy/models/order/order_model.dart';

class OrderRepository extends FetchClient {
  Future<List<OrderModel>> getOrdersToPay() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/orders/user/${AuthBloc.currentUser?.id}',
          queryParameters: {'status': 'PENDING', 'type': 'DEFAULT'});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderModel> orders = [];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      log("Error when get api order to pay: $e");
      return [];
    }
  }

  Future<List<OrderModel>> getOrdersPreparing() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/orders/user/${AuthBloc.currentUser?.id}',
          queryParameters: {'status': 'PREPARING', 'type': 'GROUP_BY_SHOP'});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderModel> orders = [];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      log("Error when get api order to pay: $e");
      return [];
    }
  }

  Future<List<OrderModel>> getOrdersToDelivery() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/orders/user/${AuthBloc.currentUser?.id}',
          queryParameters: {'status': 'DELIVERY', 'type': 'GROUP_BY_SHOP'});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderModel> orders = [];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      log("Error when get api order to pay: $e");
      return [];
    }
  }

  Future<List<OrderModel>> getOrdersCompleted() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/orders/user/${AuthBloc.currentUser?.id}',
          queryParameters: {'status': 'COMPLETED', 'type': 'GROUP_BY_SHOP'});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderModel> orders = [];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      log("Error when get api order to pay: $e");
      return [];
    }
  }

  Future<List<OrderModel>> getOrdersCanceled() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/orders/user/${AuthBloc.currentUser?.id}',
          queryParameters: {'status': 'CANCELED', 'type': 'GROUP_BY_SHOP'});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderModel> orders = [];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      log("Error when get api order to pay: $e");
      return [];
    }
  }

  Future<List<OrderModel>> getOrdersReturn() async {
    try {
      final Response<dynamic> response = await super.getData(
          path: '/api/orders/user/${AuthBloc.currentUser?.id}',
          queryParameters: {'status': 'RETURN', 'type': 'GROUP_BY_SHOP'});
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<OrderModel> orders = [];
        for (var element in data) {
          orders.add(OrderModel.fromJson(element));
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      log("Error when get api order to pay: $e");
      return [];
    }
  }
}
