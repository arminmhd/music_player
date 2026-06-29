class DurationFormatter {
  const DurationFormatter._();

  static String format(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString()}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }

    return '${minutes.toString()}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}
