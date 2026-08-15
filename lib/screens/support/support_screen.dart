import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../core/utils/app_toast.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<_FaqItem> faqs = [
      _FaqItem(
        question: 'How do I use this app template?',
        answer: 'You can use this project as a starting base for any new app. Simply copy the template files and build your screens.',
      ),
      _FaqItem(
        question: 'How do I customize the app colors and theme?',
        answer: 'Navigate to lib/core/theme/app_theme.dart and modify the seed color or Light/Dark theme properties.',
      ),
      _FaqItem(
        question: 'Does this template include authentication UI?',
        answer: 'Yes! Splash, Onboarding, Login, Register, and Forgot Password screens are fully pre-built.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.headset_mic_rounded, size: 40, color: theme.colorScheme.primary),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Need Assistance?',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Our support team is available 24/7 to help you.',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ExpansionPanelList.radio(
              children: faqs
                  .map(
                    (faq) => ExpansionPanelRadio(
                      value: faq.question,
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(
                            faq.question,
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        );
                      },
                      body: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          faq.answer,
                          style: TextStyle(color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8)),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Start Live Chat',
              icon: Icons.chat_bubble_outline_rounded,
              onPressed: () {
                AppToast.showInfo(context, 'Connecting to Live Support agent...');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqItem {
  final String question;
  final String answer;

  _FaqItem({required this.question, required this.answer});
}
