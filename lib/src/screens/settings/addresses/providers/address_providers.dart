
import 'package:delta/src/app.dart';
import 'package:delta/src/screens/settings/addresses/data/address.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/dio_helper.dart';
import '../../../../shared/routes.dart';

part 'address_providers.g.dart';

@riverpod
Future<List<Address>> getUserAddresses(GetUserAddressesRef ref) async {
  final userToken = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/addresses/?page=1&?limit=4", token: userToken ?? "");
  final addresses = request!.data["data"]["addresses"];

  return addresses.map<Address>((e) => Address.fromJson(e)).toList();
}
@riverpod
Future<Position> getLocation(GetLocationRef ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
    
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  return await Geolocator.getCurrentPosition();
}

@riverpod
Future<void> addAddress(AddAddressRef ref,
    {required String city,
    required String area,
    required String street,
    required String building,
    required String flat,
    required double latitude,
    required double longitude}) async {
  final userToken = await ref.watch(tokenProvider.future);
  final request = await ref.watch(dioHelperProvider).postHTTP(
      "/api/addresses/",
      {
        "city": city,
        "area": area,
        "street": street,
        "building": building,
        "flat": flat,
        "latitude": latitude,
        "longitude": longitude
      },
      options: Options(headers: {"Authorization": "Bearer $userToken"}));


    snackbarKey.currentState!
        .showSnackBar(const SnackBar(content: Text("تمت اضافة العنون بنجاح")));
    ref.invalidate(getUserAddressesProvider);
  
}
