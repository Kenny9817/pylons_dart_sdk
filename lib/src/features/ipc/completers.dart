import 'dart:async';

import 'package:pylons_flutter/pylons_flutter.dart';
import 'package:pylons_flutter/src/features/models/sdk_ipc_response.dart';

Completer<SDKIPCResponse> cookBookCompleter = Completer();
Completer<SDKIPCResponse> cookBookUpdateCompleter = Completer();
Completer<SDKIPCResponse> recipeCompleter = Completer();
Completer<SDKIPCResponse> recipeUpdateCompleter = Completer();
Completer<SDKIPCResponse> executeRecipeCompleter = Completer();
Completer<SDKIPCResponse> enableRecipeCompleter = Completer();
Completer<SDKIPCResponse> getProfileCompleter = Completer();
Completer<SDKIPCResponse<List<Recipe>>> getAllRecipes = Completer();