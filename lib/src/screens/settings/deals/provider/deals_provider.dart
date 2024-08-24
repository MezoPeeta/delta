import 'package:delta/src/shared/dio_helper.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deals_provider.g.dart';

@riverpod
Future<List<Object?>> getMaintenaceContracts(
    GetMaintenaceContractsRef ref) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/maintenance-requests/user", token: token ?? "");

  return request!.data["data"]["requests"];
}
