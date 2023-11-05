class HttpResult<T> {
  final int _statusCode;
  final String _status;
  final T? _data;

  T? get data => _data;
  String get status => _status;
  int get statusCode => _statusCode;

  HttpResult(this._statusCode, this._status, this._data);
}