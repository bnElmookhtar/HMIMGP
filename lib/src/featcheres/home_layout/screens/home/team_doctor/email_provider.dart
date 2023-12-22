import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail(String emailBody, String receiverEmail) async {
  // Construct the email URL
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: receiverEmail,
    queryParameters: {
      'to': receiverEmail,
      'subject': 'Email from HMIMGP',
      'body': emailBody
    },
  );

  // Check if the URL can be launched
  if (await canLaunchUrl(Uri.parse(emailLaunchUri.toString()))) {
    await launchUrl(Uri.parse(emailLaunchUri.toString()));
  } else {
    // Handle error if the URL can't be launched
    print('Could not launch $emailLaunchUri');
  }
}
