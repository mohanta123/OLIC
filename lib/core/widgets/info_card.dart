import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String value;
  final String? unit;
  final String? time;
  final Color color;
  final IconData icon;
  final Widget? bottom;

  const InfoCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    this.unit,
    this.time,
    required this.color,
    required this.icon,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Icon
          Icon(icon, color: Colors.white, size: 30),

          const SizedBox(height: 12),

          // 🔹 Title
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          // 🔹 Subtitle
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],

          // 🔹 Time
          if (time != null) ...[
            const SizedBox(height: 6),
            Text(
              time!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
              ),
            ),
          ],

          const SizedBox(height: 8),

          // 🔹 Value (flex-safe)
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (unit != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 3),
                      child: Text(
                        unit!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // 🔹 Optional Bottom Widget
          if (bottom != null) ...[
            const SizedBox(height: 8),
            bottom!,
          ],
        ],
      ),
    );
  }
}
