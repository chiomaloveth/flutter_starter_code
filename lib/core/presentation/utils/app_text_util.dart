class AppTextUtil {
  AppTextUtil._();

  static String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    final adjustedDays = difference.inDays + 1;

    if (difference.isNegative) {
      return _formatFutureDate(dateTime);
    }

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} secs';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours} hr';
    }

    if (adjustedDays < 30) {
      return '$adjustedDays days';
    }

    if (adjustedDays < 365) {
      return '${dateTime.day}/${dateTime.month}';
    }

    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String _formatFutureDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);

    if (difference.inSeconds < 60) {
      return 'in ${difference.inSeconds}secs';
    }

    if (difference.inMinutes < 60) {
      return 'in ${difference.inMinutes}min';
    }

    if (difference.inHours < 24) {
      return 'in ${difference.inHours}hr';
    }

    if (difference.inDays < 30) {
      return 'in ${difference.inDays}days';
    }

    return '${dateTime.day}/${dateTime.month}';
  }
}
