import 'package:amg_local_events/constants/styleguide.dart';
import 'package:amg_local_events/models/event.dart';
import 'package:amg_local_events/models/guest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          const SizedBox(height: 100.0),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .2),
              child: Text(
                event.title,
                style: eventWhiteTitleTextStyle,
              )),
          const SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .24),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Text(
                    "-",
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    event.location,
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "GUESTS",
              style: guestTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final guest in guests)
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Image.asset(
                          guest.imagePath,
                          width: 90.0,
                          height: 90.0,
                          fit: BoxFit.cover,
                        ),
                      ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(text: event.punchLine1, style: punchLine1TextStyle),
              TextSpan(text: event.punchLine2, style: punchLine2TextStyle),
            ])),
          ),
          if (event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                event.description,
                style: eventLocationTextStyle,
              ),
            ),
          if (event.galleryImages!.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 32.0),
              child: Text(
                "GALLERY",
                style: guestTextStyle,
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final galleryImagePath in event.galleryImages!)
                  Container(
                      margin: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 32.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          galleryImagePath,
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ))
              ],
            ),
          ),
        ]));
  }
}
