import 'package:flutter/material.dart';
import '../responsive_widget.dart';
import 'event_index_page.dart';
import 'event_page_web.dart';

class EventPageTop extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget(
        mobileWidget: const EventIndexPage(),
        webWidget: EventPageWeb(),
      ),
    );
  }
}
