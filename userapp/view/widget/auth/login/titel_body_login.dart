import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TitelBodyLogin extends StatelessWidget {
  final String titelScreenAUTH;
  final String? bodyscreanAUTH;
  const TitelBodyLogin({
    super.key,
    required this.titelScreenAUTH,
    this.bodyscreanAUTH,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              titelScreenAUTH,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Text(
            bodyscreanAUTH!,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.black, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
