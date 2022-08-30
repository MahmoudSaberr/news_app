import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/cache_helper.dart';
import 'package:news_app/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void changeAppMode({bool fromShared})
  {
    if (fromShared != null)
    {
      //معناها وقت ما بيفتح التطبيق
      //مش محتاج اكيش لانه معناه ان فيه قيمة بالتالي هياخدها يعرضها (مفيش تغيير )
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else
    {
      //وقت ما تدوس على الزرار
      // محتاج اكيش لان القيمة اتغيرت
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeState());
      });
    }
  }
}