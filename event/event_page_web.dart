import 'package:flutter/material.dart';
import 'event_create_page_web.dart';
import 'event_index_page_web.dart';

class EventPageWeb extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(
            child: CreateEventPageWeb(),
          ),
          Expanded(child: EventIndexPageWeb()),
        ],
      ),
    );
  }
}
