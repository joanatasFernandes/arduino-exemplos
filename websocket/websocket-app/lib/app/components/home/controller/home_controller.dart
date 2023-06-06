import 'package:app_database/app_database.dart';
import 'package:app_domain/app_domain.dart';
import 'package:app_websocket/app_websocket.dart';
import 'package:dart_net_work/dart_net_work.dart';
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
    _connectionService.connect();
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
}
