import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/backend/api_requests/api_calls.dart';

class XanoAuthManager extends ChangeNotifier {
  XanoAuthManager._();
  static final XanoAuthManager _instance = XanoAuthManager._();
  static XanoAuthManager get instance => _instance;

  static const String _kTokenKey = 'xano_auth_token';
  static const String _kUserDataKey = 'xano_user_data';
  static const String _kAddressKey = 'xano_user_address';

  String? _token;
  Map<String, dynamic>? _userData;
  String? _currentAddress;

  String? get token => _token;
  Map<String, dynamic>? get userData => _userData;
  String? get currentAddress => _currentAddress;

  bool get loggedIn => _token != null && _token!.trim().isNotEmpty;
  int? get userId => _userData?['id'] is int ? _userData!['id'] as int : null;
  String? get userName => _userData?['name'] as String?;
  String? get userEmail => _userData?['email'] as String?;
  String? get userRole => _userData?['role'] as String?;

  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString(_kTokenKey);
      _currentAddress = prefs.getString(_kAddressKey);

      final userDataString = prefs.getString(_kUserDataKey);
      if (userDataString != null && userDataString.isNotEmpty) {
        try {
          _userData = json.decode(userDataString) as Map<String, dynamic>;
        } catch (_) {}
      }

      if (loggedIn) {
        // Refresh profile in background
        _refreshUserProfile();
      }
    } catch (e) {
      if (kDebugMode) {
        print('XanoAuthManager initialize error: $e');
      }
    }
  }

  Future<void> _refreshUserProfile() async {
    if (!loggedIn) return;
    try {
      final res = await XanoAuthGroup.meCall.call(authToken: _token);
      if (res.succeeded && res.jsonBody is Map) {
        _userData = Map<String, dynamic>.from(res.jsonBody as Map);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_kUserDataKey, json.encode(_userData));
        notifyListeners();
      } else if (res.statusCode == 401) {
        await logout();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error refreshing Xano user profile: $e');
      }
    }
  }

  Future<ApiCallResponse> login(String email, String password) async {
    final response = await XanoAuthGroup.loginCall.call(
      email: email.trim(),
      password: password,
    );

    if (response.succeeded) {
      final authToken = XanoLoginCall.authToken(response);
      if (authToken != null && authToken.isNotEmpty) {
        _token = authToken;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_kTokenKey, authToken);

        // Fetch fresh user data
        final meRes = await XanoAuthGroup.meCall.call(authToken: authToken);
        if (meRes.succeeded && meRes.jsonBody is Map) {
          _userData = Map<String, dynamic>.from(meRes.jsonBody as Map);
          await prefs.setString(_kUserDataKey, json.encode(_userData));
        } else {
          // Fallback with user_id
          final uid = XanoLoginCall.userId(response);
          _userData = {
            if (uid != null) 'id': uid,
            'email': email.trim(),
          };
          await prefs.setString(_kUserDataKey, json.encode(_userData));
        }
        notifyListeners();
      }
    }

    return response;
  }

  Future<ApiCallResponse> signup(
    String name,
    String email,
    String password,
  ) async {
    final response = await XanoAuthGroup.signupCall.call(
      name: name.trim(),
      email: email.trim(),
      password: password,
    );

    if (response.succeeded) {
      final authToken = XanoSignupCall.authToken(response);
      if (authToken != null && authToken.isNotEmpty) {
        _token = authToken;
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(_kTokenKey, authToken);

        // Fetch fresh user data
        final meRes = await XanoAuthGroup.meCall.call(authToken: authToken);
        if (meRes.succeeded && meRes.jsonBody is Map) {
          _userData = Map<String, dynamic>.from(meRes.jsonBody as Map);
          await prefs.setString(_kUserDataKey, json.encode(_userData));
        } else {
          final uid = XanoSignupCall.userId(response);
          _userData = {
            if (uid != null) 'id': uid,
            'name': name.trim(),
            'email': email.trim(),
          };
          await prefs.setString(_kUserDataKey, json.encode(_userData));
        }
        notifyListeners();
      }
    }

    return response;
  }

  Future<void> saveAddress(String address) async {
    _currentAddress = address.trim();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kAddressKey, _currentAddress!);
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    _userData = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kTokenKey);
    await prefs.remove(_kUserDataKey);
    notifyListeners();
  }
}
