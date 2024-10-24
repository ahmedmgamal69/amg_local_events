import 'package:amg_local_events/UI/event_details/event_details.content.dart';
import 'package:amg_local_events/UI/event_details/event_details_background.dart';
import 'package:amg_local_events/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
          value: event,
          child: const Stack(
            fit: StackFit.expand,
            children: <Widget>[
              EventDetailsBackground(),
              EventDetailsContent(),
            ],
          )),
    );
  }
}
