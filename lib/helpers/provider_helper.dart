import 'package:provider/provider.dart';

T getProvider<T>(context, {bool listen = false}) {
  return Provider.of<T>(context, listen: listen);
}