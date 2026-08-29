import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hobitix/shared/widgets/home/event_detail_app_bar.dart';

class EventDetailPage extends StatelessWidget {
  final String eventId;

  const EventDetailPage({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return const _EventDetailView();
  }
}

class _EventDetailView extends StatefulWidget {
  const _EventDetailView();

  @override
  State<_EventDetailView> createState() => _EventDetailViewState();
}

class _EventDetailViewState extends State<_EventDetailView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF5B5CE2);
    const backgroundColor = Color(0xFFF6F7FB);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const EventDetailAppBar(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 328,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 328,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1531058020387-3be344556be6"
                          "?auto=format&fit=crop&w=500&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Gradient overlay
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: .28),
                                Colors.transparent,
                                Colors.black.withValues(alpha: .25),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 16,
                        right: 14,
                        child: Row(
                          children: [
                            _CircleButton(
                              icon: isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              active: isFavorite,
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            ),
                            const SizedBox(width: 10),
                            _CircleButton(
                              icon: Icons.share_outlined,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(color: backgroundColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 18),
                        child: Row(
                          children: [
                            _Tag(
                              label: 'Concert',
                              color: const Color(0xFFE8E5FF),
                              textColor: primaryColor,
                            ),
                            const SizedBox(width: 7),
                            _Tag(
                              label: 'Live Music',
                              color: const Color(0xFFE2F6EE),
                              textColor: const Color(0xFF2C9B76),
                            ),
                          ],
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Indigo Nights Concert',
                              style: TextStyle(
                                fontSize: 23,
                                height: 1.15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF222B45),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '18+ · 14 Reviews',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF9BA2B4),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _InfoCard(
                          child: Column(
                            children: [
                              _InfoRow(
                                icon: Icons.calendar_today_outlined,
                                iconColor: primaryColor,
                                title: 'Friday, Oct 27',
                                subtitle: '8:00 PM - 11:30 PM',
                                actionText: 'Add to Calendar',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: _InfoCard(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 13,
                              bottom: 13,
                              left: 14,
                              right: 14,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'The Grand Atrium',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF27314A),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text(
                                        'Downtown Avenue, New York',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xFF9BA2B4),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      Container(
                                        height: 64,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                          color: const Color(0xFFE7ECEB),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 18,
                                              top: 28,
                                              child: Container(
                                                width: 46,
                                                height: 2,
                                                color: const Color(0xFFD0D7D5),
                                              ),
                                            ),
                                            Positioned(
                                              left: 64,
                                              top: 4,
                                              bottom: 4,
                                              child: Container(
                                                width: 3,
                                                color: const Color(0xFFD5DCD9),
                                              ),
                                            ),
                                            Positioned(
                                              left: 100,
                                              top: 17,
                                              child: Container(
                                                width: 45,
                                                height: 2,
                                                color: const Color(0xFFD4DAD7),
                                              ),
                                            ),
                                            const Center(
                                              child: Icon(
                                                Icons.location_on_rounded,
                                                color: primaryColor,
                                                size: 22,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 21),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'About this event',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF27314A),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Experience an unforgettable evening of live music at the iconic Grand Atrium. Indigo Nights brings together a curated lineup of contemporary artists blending electronic, soul and alternative performances.\n\nThis immersive performance features state-of-the-art acoustics and a breathtaking display of lights. The artist lineup is set to keep the audience energized throughout the night. Doors open at 7:00 PM and the show begins promptly at 8:00 PM.\n\nLimited seating is available, so secure your tickets early for a complimentary beverage.',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.75,
                            color: Color(0xFF6F7789),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Container(height: 1, color: const Color(0xFFE8EAF0)),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 16,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFE9ECF3),
                                border: Border.all(
                                  color: const Color(0xFFDDE1EB),
                                ),
                              ),
                              child: const Icon(
                                Icons.music_note_rounded,
                                size: 18,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(width: 11),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ORGANIZED BY',
                                    style: TextStyle(
                                      fontSize: 7,
                                      letterSpacing: 1,
                                      color: Color(0xFF9BA2B4),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Sonic Arts Productions',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF27314A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 88),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 74,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(top: BorderSide(color: Color(0xFFE5E8F0))),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .04),
                    blurRadius: 14,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFF9BA2B4),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '\$48.00',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF27314A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 105,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed('tickets-book');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool active;

  const _CircleButton({
    required this.icon,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: .88),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 34,
          height: 34,
          child: Icon(
            icon,
            size: 17,
            color: active ? const Color(0xFF5B5CE2) : const Color(0xFF4C556B),
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;

  const _Tag({
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: const Color(0xFFE9EBF1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .015),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String actionText;

  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 13, 20, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(icon, size: 17, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF27314A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 8.5,
                    color: Color(0xFF9BA2B4),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  actionText,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5B5CE2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
