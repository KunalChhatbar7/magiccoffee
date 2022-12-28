import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magiccoffee/Ui/Dialogs/ApiErrorMessageDialog.dart';
import 'package:magiccoffee/Ui/Dialogs/CustomProgressDialog.dart';
import 'package:magiccoffee/bloc/StatusCode.dart';
import 'package:magiccoffee/model/Errors/ErrorBody.dart';
import 'package:magiccoffee/resources/string_manager.dart';

import 'NetworkService.dart';

import 'package:http/http.dart' as http;

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkService? networkService;
  final BuildContext context;
  bool isNetworkAvailable = true;
  String customerId = "";

  NetworkCubit({this.networkService, required this.context})
      : super(NetworkInitial()) {}
  bool isDialogShowing = false;
  bool isErrorDialogShowing = false;
  var error = ErrorBody();

  setToken(String token) {
    networkService!.setToken(token);
  }

  // Future<http.Response?> networkPutRequest(
  //     {String? endpoint,
  //     Map<String, dynamic>? body,
  //     bool? isformdata,
  //     isLoader = false}) async {
  //   try {
  //     http.Response? response;
  //     response = await networkService!.put(
  //       endpoint!,
  //       body,
  //       isformdata!,
  //     );
  //
  //     ServiceUtils.printLog(response!.body);
  //
  //     if (response.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(response.body));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     errorAPICall(endpoint!, endpoint, e.toString());
  //   }
  //   return null;
  // }

  // Future<http.Response?> networkPostRequest(
  //     {String? endpoint,
  //     Map<String, dynamic>? body,
  //     bool? isformdata,
  //     bool isLoader = false}) async {
  //   try {
  //     http.Response? response;
  //     response = await networkService!.post(
  //       endpoint!,
  //       body,
  //       isformdata!,
  //     );
  //
  //     if (response!.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       ServiceUtils.printLog(response.body);
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(response.body));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //     errorAPICall(endpoint!, endpoint, e.toString());
  //   }
  //   return null;
  // }

  // Future<http.Response?> networkPostWithFormRequest(
  //     {String? endpoint,
  //     Map<String, String>? body,
  //     bool? isformdata,
  //     bool isLoader = false}) async {
  //   try {
  //     http.Response? response;
  //     response = await networkService!.postWithForm(
  //       endpoint!,
  //       body,
  //       isformdata!,
  //     );
  //
  //     if (response!.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(response.body));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //     errorAPICall(endpoint!, endpoint, e.toString());
  //   }
  //   return null;
  // }

  // Future<http.Response?> networkPatchRequest(
  //     {String? endpoint,
  //     Map<String, dynamic>? body,
  //     bool? isformdata,
  //     bool isLoader = false}) async {
  //   try {
  //     http.Response? response;
  //     response = await networkService!.patch(
  //       endpoint!,
  //       body,
  //       isformdata!,
  //     );
  //
  //     if (response!.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(response.body));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //     errorAPICall(endpoint!, endpoint, e.toString());
  //   }
  //   return null;
  // }

  // Future<http.StreamedResponse?> networkFileUpload(
  //     String endpoint, String path, String format) async {
  //   try {
  //     http.StreamedResponse? response;
  //     response = await networkService!.uploadFile(
  //       endpoint,
  //       path,
  //     );
  //     final respStr = await response!.stream.bytesToString();
  //
  //     if (response.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(respStr));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //     errorAPICall(endpoint, endpoint, e.toString());
  //   }
  //   return null;
  // }

  Future<http.Response?> networkGetRequest(
    String endpoint,
    // Map<String, String>? body,
  ) async {
    try {
      http.Response? response;
      response = await NetworkService().get(
        endpoint,
        // body,
      );

      if (response!.statusCode == StatusCodes.SUCESS) {
        return response;
      } else {
        if (response.statusCode == StatusCodes.TIMEOUT) {
          error = ErrorBody(message: StringManager.requestTimeOut);
        } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
          error = ErrorBody(message: StringManager.internalServerError);
        } else {
          error = ErrorBody.fromJson(json.decode(response.body));
          error.endpoiont = endpoint;
          emit(ErrorState(errorBody: error));
          emit(NetworkInitial());
          if (response.statusCode != StatusCodes.BAD_REQUEST &&
              response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
            errorAPICall(endpoint, endpoint, error.message!);
          }
        }
      }
    } on SocketException {
      error = ErrorBody(message: StringManager.internetConnectionError);
      emit(ErrorState(errorBody: error));
      emit(NetworkInitial());
    } catch (e) {
      var error = ErrorBody(message: e.toString());
      emit(ErrorState(errorBody: error));
      emit(NetworkInitial());
      // errorAPICall(endpoint, endpoint, e.toString());
    }
    return null;
  }

  // Future<http.Response?> networkDeleteRequest(
  //     String endpoint, Map<String, String>? body, bool isformdata) async {
  //   try {
  //     http.Response? response;
  //     response = await networkService!.delete(
  //       endpoint,
  //       body!,
  //     );
  //
  //     if (response!.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(response.body));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //     errorAPICall(endpoint, endpoint, e.toString());
  //   }
  //   return null;
  // }

  // Future<http.Response?> networkDeleteRequestWithBody(
  //     String endpoint, Map<String, dynamic>? body, bool isformdata) async {
  //   try {
  //     http.Response? response;
  //     response = await networkService!.deleteWithBody(
  //       endpoint,
  //       body!,
  //     );
  //
  //     if (response!.statusCode == StatusCodes.SUCESS) {
  //       return response;
  //     } else {
  //       if (response.statusCode == StatusCodes.TIMEOUT) {
  //         error = ErrorBody(message: StringManager.requestTimeOut);
  //       } else if (response.statusCode == StatusCodes.INTERNAL_SERVER_ERROR) {
  //         error = ErrorBody(message: StringManager.internalServerError);
  //       } else {
  //         error = ErrorBody.fromJson(json.decode(response.body));
  //         error.endpoiont = endpoint;
  //         emit(ErrorState(errorBody: error));
  //         emit(NetworkInitial());
  //         if (response.statusCode != StatusCodes.BAD_REQUEST &&
  //             response.statusCode != StatusCodes.INTERNAL_SERVER_ERROR) {
  //           errorAPICall(endpoint, endpoint, error.message!);
  //         }
  //       }
  //     }
  //   } on SocketException {
  //     error = ErrorBody(message: StringManager.internetConnectionError);
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //   } catch (e) {
  //     var error = ErrorBody(message: e.toString());
  //     emit(ErrorState(errorBody: error));
  //     emit(NetworkInitial());
  //     errorAPICall(endpoint, endpoint, e.toString());
  //   }
  //   return null;
  // }

  showLoader(BuildContext context) {
    if (!isDialogShowing) {
      isDialogShowing = true;
      showDialog(
          context: context,
          barrierColor: Colors.transparent,
          builder: (BuildContext context) {
            return const CustomProgressDialog();
          }).then((value) {
        isDialogShowing = false;
      });
    }
  }

  hideLoader(BuildContext context) {
    if (isDialogShowing) {
      Navigator.pop(context);
    }
  }

  errorAPICall(String serviceName, String api, String errorDetail) async {
    var map = new Map<String, String>();
    map['customerId'] = customerId;
    map['serviceName'] = serviceName;
    map['api'] = api;
    map['errorDetail'] = errorDetail;
    // networkService!.post(
    //   "ENDPOINT",
    //   map,
    //   true,
    // );
  }

  void showApiErrorDialog(BuildContext context, String message, String heading,
      Function callback) async {
    if (!isErrorDialogShowing) {
      isErrorDialogShowing = true;
      if (!message.contains("Incorrect password")) {
        await showDialog(
            context: context,
            barrierLabel: "Error",
            builder: (BuildContext context) {
              return ApiErrorMessageDialog(
                descriptions: message,
                title: heading,
              );
            });
        callback();
        isErrorDialogShowing = false;
      }
    }
  }

  emitState(ErrorBody error) {
    emit(ErrorState(errorBody: error));
  }

  dispose() {}
}

abstract class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {}

class AuthTokenIssue extends NetworkState {
  final ErrorBody errorBody;
  AuthTokenIssue({required this.errorBody});
}

class ApiCalling extends NetworkState {}

class ApiCallDone extends NetworkState {}

class ErrorState extends NetworkState {
  final ErrorBody errorBody;
  ErrorState({required this.errorBody});
}

class SyncErrorState extends NetworkState {
  final ErrorBody errorBody;
  SyncErrorState({required this.errorBody});
}
