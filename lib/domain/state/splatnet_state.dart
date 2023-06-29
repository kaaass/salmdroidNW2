enum CommType {
  nso,
  imink,
  splatnet,
  empty,
  finish,
  error,
}

enum CommApi {
  empty(''),
  appVersion('NSO version'),
  appVersionI('NSO version(i)'),
  sessionToken('/api/session_token'),
  token('/api/token'),
  login('/v3/Account/Login'),
  f('f'),
  getWebServiceToken('/v2/Game/GetWebServiceToken'),
  bulletTokens('/api/bullet_tokens'),
  summary('Summary'),
  result('Result'),
  ;

  const CommApi(this.apiName);
  final String apiName;
}

enum CommStatus {
  start,
  processing,
  success,
  fail,
}

class SplatNetStateUnit {
  CommType type;
  CommApi api;
  CommStatus status;

  SplatNetStateUnit(
      {required this.type, required this.api, required this.status});
}

class SplatNetState {
  String type = '';
  String api = '';
  String status = '';
  int count = 0;
  int max = 0;
  String msg = '';

  void clear() {
    type = '';
    api = '';
    status = '';
    count = 0;
    max = 0;
    msg = '';
  }
}
