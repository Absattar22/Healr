import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:healr/features/search/presentation/views/widgets/search_by_specialties.dart';
import 'package:healr/features/search/presentation/views/widgets/search_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Search for a doctor",
                style:
                    Styles.textStyle24.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: 16.h),
            const SearchField(),
            SizedBox(height: 16.h),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchInitial) {
                  return const SearchBySpecialties();
                } else if (state is SearchLoading) {
                  return Column(
                    children: [
                      SizedBox(height: 270.h),
                      CircularProgressIndicator(
                        color: kSecondaryColor,
                      ),
                    ],
                  );
                } else if (state is SearchFailure) {
                  return Column(
                    children: [
                      SizedBox(height: 270.h),
                      Text("No doctors found with that name.",
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                    ],
                  );
                } else if (state is SearchSuccessName) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.name.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.name.data![index].name!),
                        subtitle: Text(state.name.data![index].name ?? ""),
                      );
                    },
                  );
                } else if (state is SearchSuccessSpecial) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.specialization.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.specialization.data![index].name!),
                        subtitle: Text(
                            state.specialization.data![index].specialization ??
                                ""),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}
