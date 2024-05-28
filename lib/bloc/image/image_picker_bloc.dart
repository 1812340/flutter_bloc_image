
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_bloc/bloc/image/image_picker_event.dart';
import 'package:multi_bloc/bloc/image/image_picker_state.dart';
import 'package:multi_bloc/utlis/image_picker_utlis.dart';

class ImageBloc extends Bloc<ImageEvent , ImageState>{

  final ImagePickerUtlis imagePickerUtlis;

   ImageBloc(this.imagePickerUtlis) : super(const ImageState()){
    on<CameraCapture>(cameraCapture);
   }

   void cameraCapture(CameraCapture event, Emitter<ImageState> states)async{
      XFile? file = await imagePickerUtlis.cameraCapture();
      emit(state.copyWith(file: file));
   }

   void gallaryCapture(CameraCapture event, Emitter<ImageState> states)async{
    XFile? file= await imagePickerUtlis.GallaryPicker();
    emit(state.copyWith(file: file));
   }}