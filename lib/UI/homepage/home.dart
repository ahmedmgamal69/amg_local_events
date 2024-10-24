import 'package:amg_local_events/UI/event_details/event_details_page.dart';
import 'package:amg_local_events/UI/homepage/category_widget.dart';
import 'package:amg_local_events/UI/homepage/event_widget.dart';
import 'package:amg_local_events/UI/homepage/homeBackground.dart';
import 'package:amg_local_events/app_state.dart';
import 'package:amg_local_events/constants/styleguide.dart';
import 'package:amg_local_events/models/category.dart';
import 'package:amg_local_events/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "LOCAL EVENTS",
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30.0,
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        "What's Up",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appstate, _) =>
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(children: <Widget>[
                                  for (final category in categories)
                                    CategoryWidget(category: category)
                                ])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Consumer<AppState>(
                          builder: (context, appState, _) => Column(
                                children: <Widget>[
                                  for (final event in events.where((e) => e
                                      .categoryIds!
                                      .contains(appState.selectedCategoryId)))
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetailsPage(
                                                        event: event)));
                                      },
                                      child: EventWidget(
                                        event: event,
                                      ),
                                    )
                                ],
                              )),
                    ),
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
