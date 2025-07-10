import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healr/core/constants.dart';
import 'package:healr/core/global_appoint.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Future<void> book() async {
    emit(BookingLoading());

    await Future.delayed(const Duration(seconds: 2));

    // Get current user's token
    String currentToken = kToken ?? "default_user";

    // Check booking status for current user
    bool currentUserBooked = getUserBookingStatus(currentToken);

    print("User token: $currentToken"); // Debug print
    print("User booking status: $currentUserBooked"); // Debug print

    if (currentUserBooked == true) {
      print("Emitting BookingSuccess"); // Debug print
      emit(BookingSuccess(waitingPeopleCount: Random().nextInt(4)));
    } else {
      print("Emitting BookingFailure"); // Debug print
      emit(BookingFailure());
    }
  }

  // Method to book appointment for current user
  void bookAppointment() {
    String currentToken = kToken ?? "default_user";
    setUserBookingStatus(currentToken, true);
    book(); // Refresh the UI
  }

  // Method to cancel appointment for current user
  void cancelAppointment() {
    String currentToken = kToken ?? "default_user";
    setUserBookingStatus(currentToken, false);
    book(); // Refresh the UI
  }

  // Method to check if current user has an active booking
  bool isAppointmentBookedForCurrentUser() {
    String currentToken = kToken ?? "default_user";
    return getUserBookingStatus(currentToken);
  }

  void clearAllBookingState() {
    String currentToken = kToken ?? "default_user";
    clearUserBookingStatus(currentToken);
    emit(BookingInitial()); // Reset to initial state
    book();
  }
}
