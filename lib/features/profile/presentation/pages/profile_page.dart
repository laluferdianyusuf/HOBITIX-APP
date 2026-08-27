import 'package:flutter/material.dart';
import 'package:hobitix/shared/widgets/profile/profile_app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: const ProfileAppBar(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              const _ProfileHeader(),

              const SizedBox(height: 24),

              _buildSectionTitle('ACCOUNT SETTINGS'),

              const SizedBox(height: 8),

              _buildMenuCard(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.person_outline_rounded,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.credit_card_outlined,
                    title: 'Payment Methods',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'My Tickets',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 22),

              _buildSectionTitle('PREFERENCES'),

              const SizedBox(height: 8),

              _buildMenuCard(
                children: [
                  _ProfileSwitchItem(
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    value: notificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationEnabled = value;
                      });
                    },
                  ),
                  _ProfileMenuItem(
                    icon: Icons.language_rounded,
                    title: 'Language',
                    trailingText: 'English',
                    onTap: () {},
                  ),
                  _ProfileSwitchItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    value: darkModeEnabled,
                    onChanged: (value) {
                      setState(() {
                        darkModeEnabled = value;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 22),

              _buildSectionTitle('SUPPORT & LEGAL'),

              const SizedBox(height: 8),

              _buildMenuCard(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.help_outline_rounded,
                    title: 'Help Center',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                  _ProfileMenuItem(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.4,
          color: Color(0xFF9CA3AF),
        ),
      ),
    );
  }

  Widget _buildMenuCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 68,
              height: 68,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFE5E7EB),
              ),
              child: const ClipOval(
                child: Icon(Icons.person, size: 38, color: Color(0xFF374151)),
              ),
            ),

            Positioned(
              right: -1,
              bottom: 1,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color(0xFF5B5CE2),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF4F6FA), width: 2),
                ),
                child: const Icon(Icons.edit, size: 11, color: Colors.white),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        const Text(
          'Alex Rivers',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1F2937),
          ),
        ),

        const SizedBox(height: 4),

        const Text(
          'alex.rivers@gmail.com',
          style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 54,
        child: Row(
          children: [
            const SizedBox(width: 14),

            Icon(icon, size: 18, color: const Color(0xFF6B7280)),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF374151),
                ),
              ),
            ),

            if (trailingText != null) ...[
              Text(
                trailingText!,
                style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
              ),
              const SizedBox(width: 6),
            ],

            const Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: Color(0xFFB0B7C3),
            ),

            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}

class _ProfileSwitchItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ProfileSwitchItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: Row(
        children: [
          const SizedBox(width: 14),

          Icon(icon, size: 18, color: const Color(0xFF6B7280)),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),
          ),

          Transform.scale(
            scale: 0.78,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF5B5CE2),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFE5E7EB),
            ),
          ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
