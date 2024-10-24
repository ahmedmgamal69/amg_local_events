import 'package:amg_local_events/constants/styleguide.dart';
import 'package:amg_local_events/models/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                child: Image.asset(
                  event.imagePath,
                  height: 150.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: eventTitleTextStyle,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          FittedBox(
                            child: Row(
                              children: <Widget>[
                                const Icon(Icons.location_on),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  event.location,
                                  style: eventLocationTextStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        event.duration.toUpperCase(),
                        textAlign: TextAlign.right,
                        style: eventLocationTextStyle.copyWith(
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
