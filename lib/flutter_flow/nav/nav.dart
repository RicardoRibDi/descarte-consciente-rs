import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : TelaDeLoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : TelaDeLoginWidget(),
        ),
        FFRoute(
          name: 'telaDeLogin',
          path: '/telaDeLogin',
          builder: (context, params) => TelaDeLoginWidget(),
        ),
        FFRoute(
          name: 'telaDeCadastro',
          path: '/telaDeCadastro',
          builder: (context, params) => TelaDeCadastroWidget(),
        ),
        FFRoute(
          name: 'telaSenhaRecuperar',
          path: '/telaSenhaRecuperar',
          builder: (context, params) => TelaSenhaRecuperarWidget(),
        ),
        FFRoute(
          name: 'telaPerfil',
          path: '/telaPerfil',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'telaPerfil')
              : NavBarPage(
                  initialPage: 'telaPerfil',
                  page: TelaPerfilWidget(),
                ),
        ),
        FFRoute(
          name: 'telaPerfilEditar',
          path: '/telaPerfilEditar',
          asyncParams: {
            'tipoDeUsuario': getDoc(['usuarios'], UsuariosRecord.fromSnapshot),
            'nome': getDoc(['usuarios'], UsuariosRecord.fromSnapshot),
            'telefone': getDoc(['usuarios'], UsuariosRecord.fromSnapshot),
            'endereco': getDoc(['usuarios'], UsuariosRecord.fromSnapshot),
          },
          builder: (context, params) => TelaPerfilEditarWidget(
            email: params.getParam(
                'email', ParamType.DocumentReference, false, ['usuarios']),
            tipoDeUsuario: params.getParam('tipoDeUsuario', ParamType.Document),
            nome: params.getParam('nome', ParamType.Document),
            telefone: params.getParam('telefone', ParamType.Document),
            endereco: params.getParam('endereco', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'telaPrincipal',
          path: '/telaPrincipal',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'telaPrincipal')
              : NavBarPage(
                  initialPage: 'telaPrincipal',
                  page: TelaPrincipalWidget(),
                ),
        ),
        FFRoute(
          name: 'telaSenhaMudar',
          path: '/telaSenhaMudar',
          builder: (context, params) => TelaSenhaMudarWidget(),
        ),
        FFRoute(
          name: 'telaDoacoes',
          path: '/telaDoacoes',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'telaDoacoes')
              : TelaDoacoesWidget(),
        ),
        FFRoute(
          name: 'telaDoacoesCadastro',
          path: '/telaDoacoesCadastro',
          builder: (context, params) => TelaDoacoesCadastroWidget(),
        ),
        FFRoute(
          name: 'telaDoacoesGerenciar',
          path: '/telaDoacoesGerenciar',
          builder: (context, params) => TelaDoacoesGerenciarWidget(),
        ),
        FFRoute(
          name: 'telaDoacoesDetalhes',
          path: '/telaDoacoesDetalhes',
          asyncParams: {
            'usuarioRef': getDoc(['usuarios'], UsuariosRecord.fromSnapshot),
          },
          builder: (context, params) => TelaDoacoesDetalhesWidget(
            nome: params.getParam('nome', ParamType.String),
            nomeItem: params.getParam('nomeItem', ParamType.String),
            itemDescricao: params.getParam('itemDescricao', ParamType.String),
            usuarioRef: params.getParam('usuarioRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'telaProprietarioRequisitar',
          path: '/telaProprietarioRequisitar',
          builder: (context, params) => TelaProprietarioRequisitarWidget(),
        ),
        FFRoute(
          name: 'telaProprietarioRequisitarCompleto',
          path: '/telaProprietarioRequisitarCompleto',
          builder: (context, params) =>
              TelaProprietarioRequisitarCompletoWidget(),
        ),
        FFRoute(
          name: 'telaProprietarioEditDescarte',
          path: '/telaProprietarioEditDescarte',
          builder: (context, params) => TelaProprietarioEditDescarteWidget(),
        ),
        FFRoute(
          name: 'telaDescarteDetalhes',
          path: '/telaDescarteDetalhes',
          builder: (context, params) => TelaDescarteDetalhesWidget(
            descarteRef: params.getParam('descarteRef',
                ParamType.DocumentReference, false, ['local_descarte']),
            localizacaoUsuario:
                params.getParam('localizacaoUsuario', ParamType.LatLng),
          ),
        ),
        FFRoute(
          name: 'telaDescarteAvaliar',
          path: '/telaDescarteAvaliar',
          builder: (context, params) => TelaDescarteAvaliarWidget(
            descarteRef: params.getParam('descarteRef',
                ParamType.DocumentReference, false, ['local_descarte']),
          ),
        ),
        FFRoute(
          name: 'telaChatLista',
          path: '/telaChatLista',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'telaChatLista')
              : TelaChatListaWidget(),
        ),
        FFRoute(
          name: 'telaChat',
          path: '/telaChat',
          asyncParams: {
            'chatUsuario': getDoc(['usuarios'], UsuariosRecord.fromSnapshot),
          },
          builder: (context, params) => TelaChatWidget(
            chatUsuario: params.getParam('chatUsuario', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
            nomeUsuario: params.getParam('nomeUsuario', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'telaDenunciar',
          path: '/telaDenunciar',
          builder: (context, params) => TelaDenunciarWidget(
            usuarioDenunciado: params.getParam('usuarioDenunciado',
                ParamType.DocumentReference, false, ['usuarios']),
          ),
        ),
        FFRoute(
          name: 'telaSuporte',
          path: '/telaSuporte',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'telaSuporte')
              : TelaSuporteWidget(),
        ),
        FFRoute(
          name: 'telaSuporteCompleto',
          path: '/telaSuporteCompleto',
          builder: (context, params) => TelaSuporteCompletoWidget(),
        ),
        FFRoute(
          name: 'telaDenunciarCompleto',
          path: '/telaDenunciarCompleto',
          builder: (context, params) => TelaDenunciarCompletoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/telaDeLogin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
