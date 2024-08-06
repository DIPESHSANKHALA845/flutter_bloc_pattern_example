import 'package:bloc_pattern/constant/app_constants.dart';
import 'package:bloc_pattern/utils/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'list_cubit.dart';
import 'list_state.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ListCubit()..listPostAPI(),
      child: BlocBuilder<ListCubit, ListState>(
          builder: (context, state) {
            return _buildPage(context,state);
          }
      ),
    );
  }

  Widget _buildPage(BuildContext context, ListState state) {

    return Scaffold(
      body: state.list.isEmpty?
      LoadingOverlay.getProgressBar()
      :ListView.builder(
          shrinkWrap: true,
          itemCount:  state.list.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder:
              (BuildContext context,
              int index) {
            return listItem(state,index);
          }),
    );
  }

  Widget listItem(ListState state,int index){
    return Text("Title: ${state.list[index].title}",style: AppConstants.txtStyle.fontFamily16_400PrimaryColor,);
  }
}
