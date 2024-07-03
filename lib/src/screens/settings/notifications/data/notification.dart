
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notif with _$Notif {
  const factory Notif(
      // ignore: invalid_annotation_target
      String? userId,
      String? title,
      String? body,
      
      ) = _Notif;

  factory Notif.fromJson(Map<String, Object?> json) => _$NotifFromJson(json);
}
