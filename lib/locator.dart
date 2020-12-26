import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:son_roe/repository.dart';
import 'events/utility/constants_event.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<GetStorage>(GetStorage());
  getIt.registerSingleton<RepositoryClass>(RepositoryClass());
  getIt.registerSingleton<ConstantOfEvents>(ConstantOfEvents());


  print('locator oluşturuldu ');
}

//GetStorage box = getIt<ConstantOfGathering>();
//RepositoryClass repo = getIt<RepositoryClass>();
