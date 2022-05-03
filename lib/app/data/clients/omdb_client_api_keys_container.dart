class OMDBClientApiKeysContainer {
  int _currentApiKeyIndex = -1;

  static const _apiKeys = [
    'f951f69e',
    '62dfef86',
    'e65b17df',
    'd6a6023e',
    '71febfac',
  ];

  OMDBClientApiKeysContainer();

  String getApiKey() {
    return _apiKeys[_currentApiKeyIndex++%_apiKeys.length];
  }
}