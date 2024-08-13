import 'package:provider/provider.dart';
import '../provider/generic_provider.dart';


var providers = [
  ChangeNotifierProvider<GenericDi>(create: ((context) => GenericDi())),
  
];
