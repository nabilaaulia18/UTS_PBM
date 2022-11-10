import 'dart:convert';

import 'package:brrr/model/wisata.dart';
import 'package:brrr/wisata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stay & Slay'),
        actions: const [
          CircleAvatar(),
          SizedBox(width: 16),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  label: Icon(Icons.search),
                  hintText: 'Mau kemana nih',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(
                      color: Colors.black38,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide: BorderSide(
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FutureBuilder(
                future: rootBundle.loadString("assets/data.json"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Place> wisatas = [];
                  final data = snapshot.data!;

                  final json = jsonDecode(data) as List<dynamic>;

                  for (var element in json) {
                    wisatas.add(Place.fromJson(element));
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      wisatas.length,
                      (index) => Wisata(
                        place: wisatas[index],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
