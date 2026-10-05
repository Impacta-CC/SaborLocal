import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _authToken = prefs.getString('ff_authToken') ?? _authToken;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _userEmail = prefs.getString('ff_userEmail') ?? _userEmail;
    });
    _safeInit(() {
      _userAddress = prefs.getString('ff_userAddress') ?? _userAddress;
    });
    _safeInit(() {
      _userId = prefs.getInt('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _bloqueadoLogin = prefs.getBool('ff_bloqueadoLogin') ?? _bloqueadoLogin;
    });
    _safeInit(() {
      _bloqueioTimestamp = prefs.containsKey('ff_bloqueioTimestamp')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_bloqueioTimestamp')!)
          : _bloqueioTimestamp;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    prefs.setString('ff_authToken', value);
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String value) {
    _userEmail = value;
    prefs.setString('ff_userEmail', value);
  }

  String _userAddress = '';
  String get userAddress => _userAddress;
  set userAddress(String value) {
    _userAddress = value;
    prefs.setString('ff_userAddress', value);
  }

  String _codigoGerado = '';
  String get codigoGerado => _codigoGerado;
  set codigoGerado(String value) {
    _codigoGerado = value;
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    prefs.setInt('ff_userId', value);
  }

  int _tentativasLogin = 0;
  int get tentativasLogin => _tentativasLogin;
  set tentativasLogin(int value) {
    _tentativasLogin = value;
  }

  bool _bloqueadoLogin = false;
  bool get bloqueadoLogin => _bloqueadoLogin;
  set bloqueadoLogin(bool value) {
    _bloqueadoLogin = value;
    prefs.setBool('ff_bloqueadoLogin', value);
  }

  DateTime? _bloqueioTimestamp;
  DateTime? get bloqueioTimestamp => _bloqueioTimestamp;
  set bloqueioTimestamp(DateTime? value) {
    _bloqueioTimestamp = value;
    value != null
        ? prefs.setInt('ff_bloqueioTimestamp', value.millisecondsSinceEpoch)
        : prefs.remove('ff_bloqueioTimestamp');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
