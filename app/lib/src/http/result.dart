///
///  Author: Martin Otradovec
///  Author e-mail: xotrad00@fit.vutbr.cz
///  Date: 05. 11. 2023
///
class HttpResult<T> {
  final int _statusCode;
  final String _status;
  final T? _data;

  T? get data => _data;
  String get status => _status;
  int get statusCode => _statusCode;

  HttpResult(this._statusCode, this._status, this._data);
}