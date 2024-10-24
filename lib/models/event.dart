class Event {
  late final String imagePath,
      title,
      description,
      location,
      duration,
      punchLine1,
      punchLine2;
  late final List? categoryIds, galleryImages;

  Event({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.duration,
    required this.punchLine1,
    required this.punchLine2,
    required this.categoryIds,
    this.galleryImages,
  });
}

final fiveKmRunEvent = Event(
  imagePath: "assets/images/5_km_downtown_run.jpg",
  title: "5 Kilometer Downtown Run",
  description: "",
  location: "Pleasant Park",
  duration: "3h",
  punchLine1: "Marathon!",
  punchLine2: "The latest fed in foodology, get the inside scoup.",
  categoryIds: [0, 1],
  galleryImages: [],
);

final cookingEvent = Event(
  imagePath: "assets/images/granite_cooking_class.jpg",
  title: "Granite Cooking Class",
  description:
      "Guest list fill up fast so be sure to apply before hand to secure a spot",
  location: "Food Court Avenue",
  duration: "4h",
  punchLine1: "Granite Cooking",
  punchLine2: "The latest fad in foodology, get the inside scoup.",
  categoryIds: [0, 2],
  galleryImages: [
    "assets/images/cooking-1.jpg",
    "assets/images/cooking-2.jpg",
    "assets/images/cooking-3.jpg"
  ],
);

final musicConcert = Event(
  imagePath: "assets/images/music_concert.jpg",
  title: "Arijit Music Concert",
  description: "Listen to Arijit's latest compositions.",
  location: "D.Y. Patil Stadium, Mumbai",
  duration: "5h",
  punchLine1: "Music Lovers!",
  punchLine2: "The lated fad in foodology, get the inside scoup.",
  categoryIds: [0, 1],
  galleryImages: [
    "assets/images/music_concert.jpg",
    "assets/images/music_concert.jpg",
    "assets/images/music_concert.jpg"
  ],
);

final golfCompetition = Event(
  imagePath: "assets/images/golf_competition.jpg",
  title: "Season 2 Golf Estate",
  description: "",
  location: "NSIC Ground, Okhla",
  duration: "1d",
  punchLine1: "Golf!",
  punchLine2: "The latest fad in foodology, get the inside scoup.",
  categoryIds: [0, 3],
  galleryImages: [
    "assets/images/golf_competition.jpg",
    "assets/images/golf_competition.jpg",
    "assets/images/golf_competition.jpg"
  ],
);

final events = [
  fiveKmRunEvent,
  cookingEvent,
  musicConcert,
  golfCompetition,
];
