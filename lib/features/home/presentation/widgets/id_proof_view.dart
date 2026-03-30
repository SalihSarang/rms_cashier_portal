import 'package:flutter/material.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IdProofView extends StatelessWidget {
  final String idProofUrl;

  const IdProofView({super.key, required this.idProofUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'ID Verification Document',
          style: TextStyle(
            color: NeutralColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        if (idProofUrl.isNotEmpty)
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: NeutralColors.glassBorder),
              image: DecorationImage(
                image: CachedNetworkImageProvider(idProofUrl),
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: NeutralColors.glassBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: NeutralColors.glassBorder),
            ),
            child: const Center(
              child: Text(
                'No ID Proof Uploaded.',
                style: TextStyle(color: NeutralColors.icon),
              ),
            ),
          ),
      ],
    );
  }
}
