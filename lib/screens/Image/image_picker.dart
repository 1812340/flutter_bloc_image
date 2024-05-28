import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc/bloc/image/image_picker_bloc.dart';
import 'package:multi_bloc/bloc/image/image_picker_event.dart';
import 'package:multi_bloc/bloc/image/image_picker_state.dart';

class ImagePickerImage extends StatefulWidget {
  const ImagePickerImage({super.key});

  @override
  State<ImagePickerImage> createState() => _ImagePickerImageState();
}

class _ImagePickerImageState extends State<ImagePickerImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image picker with Bloc State management"),
      ),
      body: BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
        if(state.file==null){
            return InkWell(
              onTap: () {
                context.read<ImageBloc>().add(CameraCapture()); 
              },
              child: CircleAvatar(
                child: Icon(Icons.camera),
              ),
            );
        }else{
          return Image.file(File(state.file!.path.toString()));
        }
      },),
    );
  }
}