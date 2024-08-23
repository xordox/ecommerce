import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/presentation/authentication/cubit/age_selection_cubit.dart';
import 'package:ecommerce/presentation/authentication/cubit/ages_display_cubit.dart';
import 'package:ecommerce/presentation/authentication/cubit/ages_display_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height / 2.7,
      child: BlocBuilder<AgesDisplayCubit,AgesDisplayState>(builder: (context, state) {
        if(state is AgesLoading){
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is AgesLoaded){
            return _ages(state.ages);
        }else if(state is AgesLoadFailure){
          return Container(
            alignment: Alignment.center,
            child: Text(state.message));
        }
        else{
          return const SizedBox.shrink();
        }
      },)
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(itemBuilder: (context, index){
        return GestureDetector(
          onTap: (){
            Navigator.pop(context);
            context.read<AgeSelectionCubit>().selectAge(ages[index].data()["value"]);
          },
          child: Text(ages[index].data()["value"],
          style: const TextStyle(fontSize: 18),),
        );
      }, separatorBuilder: ((context, index) => const SizedBox(height: 20,)), itemCount: ages.length),
    );
  }
}