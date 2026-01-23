import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String? subtitle;

  // 🔹 NOW OPTIONAL
  final String? value;
  final String? unit;

  final String? time;
  final Color color;
  final String image;
  final Widget? bottom;

  const InfoCard({
    super.key,
    required this.title,
    this.subtitle,
    this.value, // ✅ optional
    this.unit,
    this.time,
    required this.color,
    required this.image,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Icon
            Image.asset(
              image,
              height: 34,
              width: 34,
              color: Colors.white,
            ),

            const SizedBox(height: 10),

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

            const Spacer(),

            // 🔹 VALUE SECTION (SAFE)
            if (value != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    value!,
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

            // 🔹 Bottom widget
            if (bottom != null) ...[
              const SizedBox(height: 8),
              bottom!,
            ],
          ],
        ),
      ),
    );
  }
}
