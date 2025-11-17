import './impls/js_util_stub.dart' as js_impl
    if (dart.library.html) './impls/js_util_web.dart'
    if (dart.library.js) 'dart:js_util'
    if (dart.library.js_interop) './impls/js_interop.dart';

export './impls/js_util_stub.dart'
    if (dart.library.html) './impls/js_util_web.dart'
    if (dart.library.js) 'dart:js_util'
    if (dart.library.js_interop) './impls/js_interop.dart';

Future<T> promiseToFuture<T>(Object promise) =>
    js_impl.promiseToFuture<T>(promise);

T? getProperty<T>(Object object, String name) =>
    js_impl.getProperty<T>(object, name);

void setProperty(Object object, String name, Object? value) =>
    js_impl.setProperty(object, name, value);

Object jsify(Object object) => js_impl.jsify(object);

bool hasProperty(Object object, Object name) =>
    js_impl.hasProperty(object, name);

Object get globalThis => js_impl.globalThis;

T? callMethod<T>(Object object, String method, List<Object?> args) =>
    js_impl.callMethod<T>(object, method, args);
