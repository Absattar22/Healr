String? appointDay = "";
String? appointTime = "";
bool? isBooked;

// Map to track booking status for each token
Map<String, bool> userBookingStatus = {};

// Helper functions to manage booking status by token
void setUserBookingStatus(String token, bool isBooked) {
  userBookingStatus[token] = isBooked;
}

bool getUserBookingStatus(String token) {
  return userBookingStatus[token] ?? false; // Default to false if not found
}

void clearUserBookingStatus(String token) {
  userBookingStatus.remove(token);
}
