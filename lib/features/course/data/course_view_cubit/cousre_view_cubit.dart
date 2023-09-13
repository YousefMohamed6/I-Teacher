import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cousre_view_state.dart';

class CousreViewCubit extends Cubit<CousreViewState> {
  CousreViewCubit() : super(CousreViewInitial());
}
