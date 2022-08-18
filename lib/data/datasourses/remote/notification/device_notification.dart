import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/core/private_keys.dart';

class DeviceNotification {
  static Future<void> sendPopupNotification({
    required List<dynamic> devicesTokens,
    required String body,
    required String title,
  }) async {
    try {
      for (final token in devicesTokens) {
        try {
          await http.post(
            Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers: <String, String>{
              'Content-Type': 'application/json',

              /// conect with cloud messaging and get server key from project settings here
              /// replace the points with your key  "key=...." and set it in [notificationKey]
              'Authorization': notificationKey,
            },
            body: jsonEncode(
              <String, dynamic>{
                'notification': <String, dynamic>{'body': body, 'title': title},
                'priority': 'high',
                'data': <String, dynamic>{
                  'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                  'id': '1',
                  'status': 'done'
                },
                "to": token,
              },
            ),
          );
        } catch (e, s) {
          if (kDebugMode) print(s);
        }
      }
    } catch (e) {
      return Future.error("error push notification");
    }
  }
}
