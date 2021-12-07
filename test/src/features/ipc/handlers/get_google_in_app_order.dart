import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_execution_by_recipe_handler.dart';
import 'package:pylons_sdk/src/features/ipc/handlers/get_google_in_app_purchase_handler.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_sdk/src/generated/pylons/google_iap_order.pb.dart';

import '../../../../mocks/mock_constants.dart';

void main() {
  test('should complete the get google in app purchase  handler future', () {
    initResponseCompleter(Strings.GET_GOOGLE_IN_APP_PURCHASE);
    var sdkResponse = SDKIPCResponse(success: false, error: '', data: '', errorCode: '', action: '');
    var handler = GetGoogleInAppPurchaseHandler();
    handler.handler(sdkResponse);
    expect(true, responseCompleters[Strings.GET_GOOGLE_IN_APP_PURCHASE]!.isCompleted);
  });

  test('should complete the get  execution by recipe handler  with data ', () async {
    initResponseCompleter(Strings.GET_EXECUTION_BY_RECIPE_ID);
    var sdkResponse = SDKIPCResponse(success: true, error: '', data: jsonEncode(GoogleInAppPurchaseOrder().createEmptyInstance()), errorCode: '', action: '');
    var handler = GetExecutionByRecipeHandler();

    Future.delayed(Duration(seconds: 1), () {
      handler.handler(sdkResponse);
      expect(true, responseCompleters[Strings.GET_GOOGLE_IN_APP_PURCHASE]!.isCompleted);
    });

    var response = await responseCompleters[Strings.GET_GOOGLE_IN_APP_PURCHASE]!.future;

    expect(true, response.success);
    expect(jsonEncode(MOCK_ORDER_ITEM.toProto3Json()), response.data);
  });


}
