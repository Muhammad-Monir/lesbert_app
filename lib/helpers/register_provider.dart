import 'package:provider/provider.dart';
import '../provider/email_provider.dart';
import '../provider/generic_provider.dart';
import '../provider/image_picker_provider.dart';


var providers = [
  ChangeNotifierProvider<GenericDi>(create: ((context) => GenericDi())),
  ChangeNotifierProvider<EmailProvider>(create: ((context) => EmailProvider())),
  ChangeNotifierProvider<ImagePickerProvider>(
    create: ((context) => ImagePickerProvider()),
  ),
 
];
