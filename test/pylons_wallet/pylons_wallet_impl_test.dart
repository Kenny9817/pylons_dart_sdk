import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pylons_sdk/pylons_sdk.dart';
import 'package:pylons_sdk/src/core/constants/strings.dart';
import 'package:pylons_sdk/src/features/ipc/ipc_constants.dart';
import 'package:pylons_sdk/src/features/ipc/responseCompleters.dart';
import 'package:pylons_sdk/src/features/models/execution_list_by_recipe_response.dart';
import 'package:pylons_sdk/src/features/models/sdk_ipc_response.dart';
import 'package:pylons_sdk/src/generated/pylons/execution.pb.dart';
import 'package:pylons_sdk/src/pylons_wallet/pylons_wallet_impl.dart';
import '../mocks/mock_constants.dart';
import '../mocks/mock_uni_link.dart';

void main() {


  getHostBasedOnOsTest();
  createLinkBasedOnOS();
  getCookBookTest();
  getProfileTest();
  getRecipesTest();
  createCookBookTest();
  executeRecipeTest();
  updateRecipeTest();
  updateCookBookTest();
  createRecipeTest();
  getRecipeTest();
  getExecutionByRecipeTest();
  getItemByIdTest();
  getItemsByOwnerTest();
  getExecutionByIdTest();

}

void getExecutionByIdTest() {


  test('should get execution based on id from wallet', () async {
    mockChannelHandler();

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse<Execution>(success: true, error: '', data:  MOCK_EXECUTION, errorCode: '', action: Strings.GET_EXECUTION_BY_ID);
      responseCompleters[Strings.GET_EXECUTION_BY_ID]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getExecutionBasedOnId(id: MOCK_EXECUTION_ID);

    expect(response.action, Strings.GET_EXECUTION_BY_ID);
  });
}

void getItemByIdTest() {

  test('should get item by id from the wallet', () async {
    mockChannelHandler();

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      var sdkResponse = SDKIPCResponse(success: true, error: '', data: MOCK_ITEM, errorCode: '', action: Strings.GET_ITEM_BY_ID);
      responseCompleters[Strings.GET_ITEM_BY_ID]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getItemById(cookbookId: MOCK_COOKBOOK_ID,itemId: MOCK_ITEM_ID);

    expect(response.action, Strings.GET_ITEM_BY_ID);
  });

}

void getItemsByOwnerTest() {
  test('should get items by owner from the wallet', () async {
    mockChannelHandler();

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse<List<Item>>(success: true, error: '', data:  [MOCK_ITEM], errorCode: '', action: Strings.GET_ITEMS_BY_OWNER);
      responseCompleters[Strings.GET_ITEMS_BY_OWNER]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getItemListByOwner(owner: MOCK_OWNER);

    expect(response.data.length, 1);
    expect(response.action, Strings.GET_ITEMS_BY_OWNER);
  });


}

void getExecutionByRecipeTest() {
  test('should get execution from the wallet', () async {
    mockChannelHandler();

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse<ExecutionListByRecipeResponse>(success: true, error: '', data:  ExecutionListByRecipeResponse.empty(), errorCode: '', action: Strings.GET_EXECUTION_BY_RECIPE_ID);
      responseCompleters[Strings.GET_EXECUTION_BY_RECIPE_ID]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getExecutionBasedOnRecipe(cookbookId: MOCK_COOKBOOK_ID,recipeId: MOCK_RECIPE_ID);

    expect(response.action, Strings.GET_EXECUTION_BY_RECIPE_ID);
  });
}

void getRecipeTest() {
  test('should get recipe from the wallet', () async {
    mockChannelHandler();

    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse<Recipe>(success: true, error: '', data:  MOCK_RECIPE, errorCode: '', action: Strings.GET_RECIPE);
      responseCompleters[Strings.GET_RECIPE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getRecipe(MOCK_COOKBOOK_ID, MOCK_RECIPE_ID);

    expect(response.data.iD, MOCK_RECIPE_ID);
    expect(response.data.cookbookID, MOCK_COOKBOOK_ID);
    expect(response.action, Strings.GET_RECIPE);
  });

}

void createRecipeTest() {
  test('should create recipe in the wallet', () async {
    mockChannelHandler();



    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);


    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_CREATE_RECIPE);
      responseCompleters[Strings.TX_CREATE_RECIPE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txCreateRecipe(MOCK_RECIPE);

    expect(true, response.success);
    expect(response.action, Strings.TX_CREATE_RECIPE);
  });


}

void updateCookBookTest() {
  test('should update cookbook in the wallet', () async {
    mockChannelHandler();



    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    var cookBook = Cookbook.create()..mergeFromProto3Json(jsonDecode(MOCK_COOKBOOK));

    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_UPDATE_COOKBOOK);
      responseCompleters[Strings.TX_UPDATE_COOKBOOK]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txUpdateCookbook(cookBook);

    expect(true, response.success);
    expect(response.action, Strings.TX_UPDATE_COOKBOOK);
  });

}

void updateRecipeTest() {
  test('should update recipe in the wallet', () async {
    mockChannelHandler();



    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);


    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_UPDATE_RECIPE);
      responseCompleters[Strings.TX_UPDATE_RECIPE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txUpdateRecipe(MOCK_RECIPE);

    expect(true, response.success);
    expect(response.action, Strings.TX_UPDATE_RECIPE);
  });

}

void mockChannelHandler() {
     TestWidgetsFlutterBinding.ensureInitialized();

  var channel = const MethodChannel('plugins.flutter.io/url_launcher');

  // Register the mock handler.
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'canLaunch') {
      return true;
    }
    return null;
  });


}

void executeRecipeTest() {
  test('should execute recipe in the wallet', () async {
    mockChannelHandler();


    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);


    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_EXECUTE_RECIPE);
      responseCompleters[Strings.TX_EXECUTE_RECIPE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txExecuteRecipe( paymentInfo: [], recipeName: MOCK_RECIPE_ID, cookbookId: MOCK_COOKBOOK_ID, itemIds: [], coinInputIndex: 0);

    expect(true, response.success);
    expect(response.action, Strings.TX_EXECUTE_RECIPE);
  });

}

void createCookBookTest() {
  test('should create cookbook in the wallet', () async {
    mockChannelHandler();


    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    var cookBook = Cookbook.create()..mergeFromProto3Json(jsonDecode(MOCK_COOKBOOK));

    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: '', errorCode: '', action: Strings.TX_CREATE_COOKBOOK);
      responseCompleters[Strings.TX_CREATE_COOKBOOK]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.txCreateCookbook(cookBook);

    expect(true, response.success);
    expect(response.action, Strings.TX_CREATE_COOKBOOK);
  });
}

void getRecipesTest() {
  test('should get profile from the wallet', () async {
    mockChannelHandler();



    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse<List<Recipe>>(success: true, error: '', data: [Recipe()..createEmptyInstance(), Recipe()..createEmptyInstance()], errorCode: '', action: Strings.GET_RECIPES);
      responseCompleters[Strings.GET_RECIPES]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getRecipes(MOCK_COOKBOOK_ID);

    expect(response.data.length, 2);
    expect(response.action, Strings.GET_RECIPES);
  });
}

void getProfileTest() {
  test('should get profile from the wallet', () async {
    mockChannelHandler();



    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    Future.delayed(Duration(milliseconds: 500), () {
      final sdkResponse = SDKIPCResponse(success: true, error: '', data: MOCK_USERNAME, errorCode: '', action: Strings.GET_PROFILE);
      responseCompleters[Strings.GET_PROFILE]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getProfile();

    expect(response.data, MOCK_USERNAME);
    expect(response.action, Strings.GET_PROFILE);
  });
}

void getCookBookTest() {
  test('should get cookbook from the wallet', () async {
    mockChannelHandler();


    var uniLink = MockUniLinksPlatform();
    when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
    var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

    var cookBook = Cookbook.create()..mergeFromProto3Json(jsonDecode(MOCK_COOKBOOK));

    Future.delayed(Duration(seconds: 1), () {
      final sdkResponse = SDKIPCResponse<Cookbook>(success: true, error: '', data: cookBook, errorCode: '', action: Strings.GET_COOKBOOK);
      responseCompleters[Strings.GET_COOKBOOK]!.complete(sdkResponse);
    });

    var response = await pylonsWallet.getCookbook(MOCK_COOKBOOK_ID);

    expect(response.data.iD, MOCK_COOKBOOK_ID);
  });
}

void createLinkBasedOnOS() {
  group('createLinkBasedOnOS', () {

    test('should return wallet link for android ', () {
      var expectedLink = '$BASE_UNI_LINK/';

      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
      var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

      var response = pylonsWallet.createLinkBasedOnOS(encodedMessage: '', isAndroid: true);
      expect(expectedLink, response);
    });

    test('should return wallet link for ios ', () {
      var expectedLink = '$BASE_UNI_LINK_IOS';

      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
      var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

      var response = pylonsWallet.createLinkBasedOnOS(encodedMessage: '', isAndroid: false);
      expect(expectedLink, response);
    });
  });
}

void getHostBasedOnOsTest() {
  group('getHostBasedOnOS', () {


    test('should return host as platform in android ', () {
      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));
      var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

      var hostBasedOnPlatform = pylonsWallet.getHostBasedOnOS(true);
      expect(MOCK_HOST, hostBasedOnPlatform);
    });

    test('should return host as platform in ios ', () {
      var uniLink = MockUniLinksPlatform();
      when(uniLink.linkStream).thenAnswer((realInvocation) => Stream<String?>.value('Jawad'));

      var pylonsWallet = PylonsWalletImpl(host: MOCK_HOST, uniLink: uniLink);

      var expectedHost = 'pylons-$MOCK_HOST';

      var hostBasedOnPlatform = pylonsWallet.getHostBasedOnOS(false);
      expect(expectedHost, hostBasedOnPlatform);
    });
  });
}
