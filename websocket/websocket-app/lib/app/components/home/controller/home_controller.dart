import 'package:app_database/app_database.dart';
import 'package:app_domain/app_domain.dart';
import 'package:app_websocket/app_websocket.dart';
import 'package:dart_net_work/dart_net_work.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:screen_view/screen_view.dart';
import 'package:websocket_app/app/components/home/navigator/home_navigator.dart';
import 'package:websocket_app/utils/delayed_future.dart';

@injectable
class HomeController extends BaseLoginController<HomeNavigator> {
  final ApiDomain apiDomain;
  final ConnectionService _connectionService;
  final MessageListener<LightMessage> messageListener;
  final LoginClient _loginClient;
  final LightClient _lightClient;
  final AuthorizationRepository _repository;

  final hostTextController = TextEditingController();
  final portController = TextEditingController();
  final apiDomainUrl = BehaviorSubject<String>.seeded('');

  HomeController(
    this.apiDomain,
    this._connectionService,
    this.messageListener,
    this._loginClient,
    this._repository,
    this._lightClient,
  );

  @override
  void init() {
    super.init();
    checkIfLoggedIn();
    hostTextController.text = 'http://192.168.2.19';
    portController.text = '8080';
    apiDomainUrl.value = apiDomain.baseApiUrl;
  }

  void changeLightStatus(LightMessage message) {
    _lightClient.request(
        status: message.status == "ON" ? "off" : "on",
        lightsId: [message.lightId],
        onRequestSuccess: (v) {},
        onRequestError: (e) {});
  }

  void checkIfLoggedIn() async {
    final authorization = await _repository.authorization();
    if (authorization != null) {
      afterSeconds(2, () {
        screenNavigator.home();
        isLoggedIn.value = true;
        _connectionService.connect();
      });
    } else {
      screenNavigator.pushReplacementNamed(loginPath);
    }
  }

  @override
  void login() {
    screenNavigator.loading();
    _loginClient.requestAuthorization(
      onRequestSuccess: onSuccess,
      request: authorizationRequest,
      onRequestError: screenNavigator.errorAlert,
    );
  }

  AuthorizationRequest get authorizationRequest => AuthorizationRequest(
    username: emailTextController.text,
    password: passwordTextController.text,
  );

  void onSuccess(AuthorizationResponse response) async {
    await _repository.updateAuthorization(response.jwt);
    screenNavigator.showSuccessful();
  }

  @override
  void onLoadHome() {
    loginSuccessful();
  }

  @override
  doLogout() {
    super.doLogout();
    _repository.logout();
    _connectionService.close();
  }

  void hostEdit() {
    if (screenNavigator.currentPage != "/host-edit") {
      screenNavigator.push("/host-edit");
    }
  }

  @override
  Future<bool> canPopPage() async {
    return !screenNavigator.canPopPage() && !screenNavigator.isHomeState();
  }

  setCustomHost() {
    if (hostTextController.text.trim().isNotEmpty) {
      apiDomain.host = hostTextController.text;
    }
    if (portController.text.trim().isNotEmpty) {
      apiDomain.port = int.parse(portController.text);
    }
    apiDomainUrl.value = apiDomain.baseApiUrl;
    screenNavigator.canPopPage();
  }
}
