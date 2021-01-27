class DecodeRetMsg {
  static int _status;
  static String _dataMsg;
  static String _errorMsg;

  DecodeRetMsg({status, dataMsg, errorMsg}) {
    _status = status;
    _dataMsg = dataMsg;
    _errorMsg = errorMsg;
  }

  int get status => _status;
  String get dataMsg => _dataMsg;
  String get errorMsg => _errorMsg;

  @override
  toString() {
    return "status: $status , dataMsg: $dataMsg , errorMsg: $errorMsg";
  }

  static toNull() {
    _status = null;
    _dataMsg = null;
    _errorMsg = null;
  }
}
