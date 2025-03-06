enum EndpointsType {
  post('POST'),
  get('GET'),
  patch('PATCH'),
  put('PUT'),
  delete('DELETE');


  const EndpointsType(this.methodName);
  
  final String methodName;
  
  static bool isModifierMethodType (final EndpointsType type) => [EndpointsType.patch, EndpointsType.put, EndpointsType.post, EndpointsType.delete].contains(type);

  static EndpointsType byMethodName(final String method) => EndpointsType.values.firstWhere(
        (final type) => type.methodName == method,
        orElse: () => EndpointsType.get,
      );
  
  static bool isModifierMethod(final String method) => isModifierMethodType(byMethodName(method));
}
