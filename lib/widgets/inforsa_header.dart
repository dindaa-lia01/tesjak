import 'package:flutter/material.dart';

class InforsaHeader extends StatelessWidget implements PreferredSizeWidget {
  final String avatarUrl;
  final VoidCallback? onAvatarTap;

  const InforsaHeader({
    super.key,
    this.avatarUrl =
        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=150',
    this.onAvatarTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF000080),
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              color: Colors.black,
              size: 24,
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            'INFORSA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onAvatarTap,
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(avatarUrl),
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
