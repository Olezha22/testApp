import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:test_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({super.key});

  @override
  ActionsScreenState createState() => ActionsScreenState();
}

class ActionsScreenState extends State<ActionsScreen> {
  int _activeIndex = -1;

  void _contactUs() async {
    setState(() {
      _activeIndex = 2;
    });
    
      await launchUrl(
        Uri.parse(
            "https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7"),
        mode: LaunchMode.externalApplication,
      );
  }

  void _shareApp() async {
    setState(() {
      _activeIndex = 1;
    });
    await Share.share(S.of(context).sharedText);
  }

  void _rateApp() async {
    setState(() {
      _activeIndex = 0;
    });

    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildActionButton(
              context,
              index: 0,
              label: S.of(context).rateApp,
              icon: Icons.star_rate,
              onPressed: _rateApp,
            ),
            const SizedBox(height: 10),
            _buildActionButton(
              context,
              index: 1,
              label: S.of(context).shareApp,
              icon: Icons.share,
              onPressed: _shareApp,
            ),
            const SizedBox(height: 10),
            _buildActionButton(
              context,
              index: 2,
              label: S.of(context).contactUs,
              icon: Icons.contact_mail,
              onPressed: _contactUs,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required int index,
      required String label,
      required IconData icon,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        size: 24,
        color: _activeIndex == index ? Colors.blue : Colors.grey.shade700,
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
        backgroundColor: Colors.blue.shade50,
      ),
    );
  }
}
