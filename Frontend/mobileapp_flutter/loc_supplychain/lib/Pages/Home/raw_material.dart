import 'package:flutter/material.dart';

class RawMaterial extends StatefulWidget {
  const RawMaterial({super.key});

  @override
  State<RawMaterial> createState() => _RawMaterialState();
}

class _RawMaterialState extends State<RawMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raw Material'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),

          ],
        ),
      )
    );
  }
}
