import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healr/core/utils/styles.dart';
import 'package:healr/features/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:healr/features/search/presentation/views/widgets/specialties_item.dart';

class SearchBySpecialties extends StatelessWidget {
  const SearchBySpecialties({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Search by specialties",
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w500,
            )),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Otolaryngology (ENT) (Ear, Nose & Throat)",
          imagePath: "assets/images/brain.svg",
          onTap: () {
            BlocProvider.of<SearchCubit>(context).specialtiesSearch("dental");
          },
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Dental Care (General Dentistry)",
          imagePath: "assets/images/tooth.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Gastroenterology (Digestive System)",
          imagePath: "assets/images/stomach.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Ophthalmology (Eyes)",
          imagePath: "assets/images/eye.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Dermatology (Skin, Hair & Nails)",
          imagePath: "assets/images/woman.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Pulmonology (Lungs & Respiratory System)",
          imagePath: "assets/images/lungs.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Psychiatry (Mental Health)",
          imagePath: "assets/images/brain 2.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Nephrology (Kidneys)",
          imagePath: "assets/images/kidney.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
        SpecialtiesItem(
          title: "Orthopedics (Bones & Joints)",
          imagePath: "assets/images/bone.svg",
          onTap: () {},
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
