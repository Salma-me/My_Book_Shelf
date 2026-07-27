import 'package:my_book_shelf/core/utils/functions/custom_show_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(context, String? url) async {
  if (url != null && url.isNotEmpty) {
    final Uri parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    } else {
      customShowSnackBar(context, 'Can\'t Launch The Url: $url');
    }
  }
}
