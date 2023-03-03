import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensores_app_v2/widgets/formas/StatusDot.dart';
import 'package:sensores_app_v2/providers/SessionProvider.dart';

import '../../providers/CamaronGetPiscinasProvider.dart';

class PiscinasGrid extends StatelessWidget {
  final int index;

  const PiscinasGrid({
    super.key, 
    required this.index
  });
  

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);
    final camaronGetPiscinasProvider = Provider.of<CamaronGetPiscinasProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => sessionProvider.piscina = camaronGetPiscinasProvider.piscinas[index],
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Center(
                child: Text(camaronGetPiscinasProvider.piscinas[index])
              ),
              StatusDot( 
                sessionProvider.piscina == camaronGetPiscinasProvider.piscinas[index] 
                ? Colors.green 
                : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}