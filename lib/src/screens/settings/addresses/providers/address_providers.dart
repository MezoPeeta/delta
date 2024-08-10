import 'package:delta/src/app.dart';
import 'package:delta/src/screens/settings/addresses/data/address.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  print(userToken);
  return addresses.map<Address>((e) => Address.fromJson(e)).toList();
}

@riverpod
Future<Position> getLocation(GetLocationRef ref) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    snackbarKey.currentState!.showSnackBar(const SnackBar(
        content: Text("يرجى السماح بنظام تحديد المواقع الخاص بك")));
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      snackbarKey.currentState!.showSnackBar(
          const SnackBar(content: Text("يرجي العلم ان تحديد الموقع مغلق")));
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  final position = await Geolocator.getCurrentPosition();
  return position;
}

@riverpod
Future<Placemark?> getPlacemark(GetPlacemarkRef ref) async {
  final position = await ref.watch(getLocationProvider.future);
  try {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarks.first;
  } catch (e) {
    snackbarKey.currentState!
        .showSnackBar(const SnackBar(content: Text("حدث خطا ما")));
  }
  return null;
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
        "locationLink": "https://maps.google.com/?q=$latitude,$longitude",
      },
      options: Options(headers: {"Authorization": "Bearer $userToken"}));
  print(city);

  snackbarKey.currentState!
      .showSnackBar(const SnackBar(content: Text("تمت اضافة العنوان بنجاح")));
  ref.invalidate(getUserAddressesProvider);
}

@riverpod
Future<void> deleteAddress(DeleteAddressRef ref,
    {required String addressID}) async {
  final userToken = await ref.watch(tokenProvider.future);
  await ref
      .watch(dioHelperProvider)
      .deleteHTTP("/api/addresses/$addressID", {}, token: userToken ?? "");

  snackbarKey.currentState!
      .showSnackBar(const SnackBar(content: Text("تمت حذف العنوان بنجاح")));
}
