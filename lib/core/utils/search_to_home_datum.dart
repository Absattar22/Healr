import 'package:healr/features/home/data/models/all_doctors_model/datum.dart'
    as home;
import 'package:healr/features/search/data/models/doctor_name_model/datum.dart'
    as search_name;
import 'package:healr/features/search/data/models/doctor_specialization_model/datum.dart'
    as search_special;

// Converts a search model Datum (name) to a home model Datum
home.Datum convertSearchDatumToHomeDatum(search_name.Datum s) {
  return home.Datum(
    image: s.image,
    name: s.name,
    specialization: s.specialization,
    rate: s.rate,
    // The following fields are not available in the search model and will be null:
    id: null,
    nationalId: null,
    exp: null,
    doctorSchedule: null,
    reviews: null,
    workingHours: null,
    createdAt: null,
    updatedAt: null,
    v: null,
  );
}

// Converts a search model Datum (specialization) to a home model Datum
home.Datum convertSpecializationDatumToHomeDatum(search_special.Datum s) {
  return home.Datum(
    image: s.image,
    name: s.name,
    specialization: s.specialization,
    rate: s.rate,
    // The following fields are not available in the search model and will be null:
    id: null,
    nationalId: null,
    exp: null,
    doctorSchedule: null,
    reviews: null,
    workingHours: null,
    createdAt: null,
    updatedAt: null,
    v: null,
  );
}
