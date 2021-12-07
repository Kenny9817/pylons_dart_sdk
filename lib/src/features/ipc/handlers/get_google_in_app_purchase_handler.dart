
import 'dart:convert';

import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/base/ipc_handler.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_sdk/src/generated/pylons/google_iap_order.pb.dart';

class GetGoogleInAppPurchaseHandler implements IPCHandler{
  @override
  void handler(SDKIPCResponse<dynamic> response) {
    print(response);
    final defaultResponse = SDKIPCResponse<GoogleInAppPurchaseOrder>(success: response.success, action: response.action, data: GoogleInAppPurchaseOrder.create()..createEmptyInstance(), error: response.error, errorCode: response.errorCode);


    try {
      if (response.success) {
        defaultResponse.data =  GoogleInAppPurchaseOrder.create()..mergeFromProto3Json(jsonDecode(response.data));
      }
    } on  FormatException catch (_){
      defaultResponse.error = _.message;
      defaultResponse.errorCode = Strings.ERR_MALFORMED_GOOGLE_ORDER;
      defaultResponse.success = false;
    }
    responseCompleters[Strings.GET_GOOGLE_IN_APP_PURCHASE]!.complete(defaultResponse);
  }
}