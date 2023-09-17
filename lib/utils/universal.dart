bool compareDate(DateTime date1, DateTime date2) =>
    date1.day == date2.day &&
    date1.month == date2.month &&
    date1.year == date2.year;
String? nameValidator(value) {
  if (value == null || value.trim().isEmpty) {
    return "Name cannot be empty.";
  }
  return null;
}

String? emailValidator(value) {
  if (value == null || value.trim().isEmpty) {
    return "Email cannot be empty";
  }
  if (!RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value.trim())) {
    return "Please enter a valid email";
  }
  return null;
}

String? carbonLimitValidator(value) {
  if (value == null || value.isEmpty) {
    return "Carbon Limit cannot be empty";
  }
  if (double.parse(value) == 0) {
    return "Carbon Limit should be grater than 0";
  }
  return null;
}
