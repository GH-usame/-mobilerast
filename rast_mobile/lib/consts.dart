import 'package:url_launcher/url_launcher.dart';

double myHeight = 0;
double myWidth = 0;

launchURL() async {
  String url = 'https://getwordninja.com/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
