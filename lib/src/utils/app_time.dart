/// Represents various durations used for animations throughout the app.
abstract class AppTime {
  /// Represents the shortest duration, typically used for
  /// very quick animations such as a button press.
  static const fastest = Duration(milliseconds: 150);

  /// Represents a short duration, suitable for animations
  /// that need to be slightly slower than [fastest].
  static const fast = Duration(milliseconds: 250);

  /// Represents a medium duration, suitable for animations
  /// that aren't too quick or too slow.
  static const medium = Duration(milliseconds: 350);

  /// Represents a slow duration, suitable for animations
  /// that are meant to be noticeable and not rushed.
  static const slow = Duration(milliseconds: 700);

  /// Represents the slowest duration, typically used for
  /// animations that need to draw the user's attention for a while.
  static const slower = Duration(milliseconds: 1000);

  /// Represents the debounce duration, typically used for
  /// debouncing input queries.
  static const debounce = Duration(milliseconds: 400);

  /// Represents the debounce duration for the map of the
  /// saved places
  static const mapDebounce = Duration(milliseconds: 200);
}
