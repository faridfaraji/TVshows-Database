USE untitled_review_website;

INSERT INTO RoleType (roleID) VALUES ("Main cast");
INSERT INTO RoleType (roleID) VALUES ("Guest cast");
INSERT INTO RoleType (roleID) VALUES ("Stunt");
INSERT INTO RoleType (roleID) VALUES ("Director");
INSERT INTO RoleType (roleID) VALUES ("Producer");
INSERT INTO RoleType (roleID) VALUES ("Writer");
INSERT INTO RoleType (roleID) VALUES ("Crew");

# Daredevil S3
INSERT INTO Platform (name, isNetwork) VALUES
("Netflix", false); # platformID 1

INSERT INTO Serial (name) VALUES
("Marvel's Daredevil"); # serialID 1

INSERT INTO Season (serialID, seasonID, orderingPlatformID, announceDate, renewed) VALUES
(1, 3, 1, '2016-7-22', null);

# Daredevil S3 season reviews
INSERT INTO Critic (name) VALUES
("Danette Chavez"); # reviewerID 1
INSERT INTO Publication (publicationName) VALUES
("The A. V. Club");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(84.5, null, 1, 3); # reviewID 1
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(1, "What's old is new — and great — again in season 3 of Marvel's Daredevil",
"Daredevil's third season is a return to form.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(1, 1);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 1, '2018-10-18');

INSERT INTO Critic (name) VALUES
("Amy Glynn"); # reviewerID 2
INSERT INTO Publication (publicationName) VALUES
("Paste");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, null, 1, 3); # reviewID 2
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(2, "The 12 Pros and Cons of Marvel's Daredevil Season Three",
"Perhaps more than any show in the whole Marvel-Netflix Globular Cluster,
Daredevil makes me question everything I like and everything I dislike about
the Heroes for Hire and their simultaneously intriguing and mind-numbing
transits through space-time.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(2, 2);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Paste", 2, '2018-10-17');

INSERT INTO Critic (name) VALUES
("Norman Wilner"); # reviewerID 3
INSERT INTO Publication (publicationName) VALUES
("NOW Toronto");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, null, 1, 3); # reviewID 3
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(3, "TV review: Netflix's Daredevil: Season 3 takes a very long time to unfold",
"I'm still watching, so I guess it's good enough.
But I also know it could be so much better.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(3, 3);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("NOW Toronto", 3, '2018-10-17');

INSERT INTO Critic (name) VALUES
("Alex Maidy"); # reviewerID 4
INSERT INTO Publication (publicationName) VALUES
("JoBlo's Movie Emporium");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, null, 1, 3); # reviewID 4
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(4, "TV Review: Marvel's Daredevil - Season 3",
"Daredevil is back and kicking ass and you will not leave your seat
until you finish this stellar run.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(4, 4);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("JoBlo's Movie Emporium", 4, '2018-10-12');

INSERT INTO Critic (name) VALUES
("Krutika Malikarjuna"); # reviewerID 5
INSERT INTO Publication (publicationName) VALUES
("TV Guide");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(84, null, 1, 3); # reviewID 5
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(5, "Marvel's Daredevil Review: Season 3 Soars to New Heights",
"Unlike the previous two seasons, Season 3 minimizes Matt and his moral dilemmas to make 
more room for what is truly one of Marvel's best supporting casts.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(5, 5);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("TV Guide", 5, '2018-10-29');

INSERT INTO Critic (name) VALUES
("Charles Barfield"); # reviewerID 6
INSERT INTO Publication (publicationName) VALUES
("The Playlist");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(84.5, null, 1, 3); # reviewID 6
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(6, "'Daredevil' Season 3 Goes Back To Basics And Shows
Marvel TV Has Some Life Left In It Yet [Review]",
"Just as Matt Murdock rises from the ashes and rubble to save Hell's Kitchen one more time,
Daredevil Season 3 could potentially do the same for Marvel shows on Netflix.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(6, 6);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The Playlist", 6, '2018-10-15');

INSERT INTO Critic (name) VALUES
("Matt Fowler"); # reviewerID 7
INSERT INTO Publication (publicationName) VALUES
("IGN");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, null, 1, 3); # reviewID 7
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(7, "Daredevil: Season 3 Review",
"Daredevil shakes off its ring rust and shines this season with a story
featuring Wilson Fisk that aches with finality.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 7);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 7, '2018-10-26');

INSERT INTO Critic (name) VALUES
("Amon Warmann"); # reviewerID 8
INSERT INTO Publication (publicationName) VALUES
("Empire");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, null, 1, 3); # reviewID 8
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(8, "Daredevil: Season 3 Review",
"It's with the action sequences that Daredevil's latest season truly outdoes itself.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(8, 8);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Empire", 8, '2018-10-12');

INSERT INTO Critic (name) VALUES
("Chris Evangelista"); # reviewerID 9
INSERT INTO Publication (publicationName) VALUES
("/Film");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, null, 1, 3); # reviewID 9
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(9, "'Daredevil' Season 3 Review: The Marvel Netflix Series Goes Back to the Basics",
"Where does this go from here? Can Daredevil survive a fourth season?
Or is it time for the character to hang up his horns for good?");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(9, 9);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("/Film", 9, '2018-10-12');

INSERT INTO Critic (name) VALUES
("Brandon Katz"); # reviewerID 10
INSERT INTO Publication (publicationName) VALUES
("Observer");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, null, 1, 3); # reviewID 10
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(10, "'Daredevil' Review: A Deeper Season 3 Looks Behind Its Hero's Mask",
"There's a linear flow to it all that is focused and efficient.
That doesn't mean the show couldn't lose steam like so many other promising
yet still flawed Marvel series on Netflix. But so far, so good.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(10, 10);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Observer", 10, '2018-10-12');

INSERT INTO Critic (name) VALUES
("James Hunt"); # reviewerID 11
INSERT INTO Publication (publicationName) VALUES
("WhatCulture");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, null, 1, 3); # reviewID 11
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(11, "Marvel's Daredevil Season 3: 10 Spoiler Free Reactions To First Six Episodes",
"With explosive, intense action sequences, fascinating character work,
and nuanced performances from its lead cast, Daredevil Season 3 is absolutely
a return to form - and that goes for both the show itself and the Netflix corner
of the MCU as a whole.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(11, 11);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("WhatCulture", 11, '2018-10-12');

INSERT INTO Critic (name) VALUES
("Sean Mulvihill"); # reviewerID 12
INSERT INTO Publication (publicationName) VALUES
("FanboyNation");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, null, 1, 3); # reviewID 12
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(12, "'Daredevil' Season 3 Review — The Man Without Fear
Has a Rocky Start for His Netflix Return",
"Daredevil is still the best of the Marvel shows on Netflix,
but these shows have grown too alike and all suffer from pacing issues.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(12, 12);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("FanboyNation", 12, '2018-10-12');

INSERT INTO Critic (name) VALUES
("Sean Mulvihill"); # reviewerID 13
INSERT INTO Publication (publicationName) VALUES
("Starburst");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, null, 1, 3); # reviewID 13
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(13, "Daredevil - Season 3",
"While flawed, the third season of Daredevil delivers on its promise
to shock and entertain, to grant us deeper insight into a tormented hero
with everything to lose.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(13, 13);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Starburst", 13, '2018-10-23');

INSERT INTO Critic (name) VALUES
("Vinnie Mancuso"); # reviewerID 14
INSERT INTO Publication (publicationName) VALUES
("Collider");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, null, 1, 3); # reviewID 14
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(14, "'Daredevil' Season 3 Review: A Return to Basics Puts Netflix's MCU Back on Target",
"Oleson and Co. have crafted such a dense, dark set-up here that,
for the first time since Jessica Jones' first season, diving back into the
streets of Hell's Kitchen feels more like a treat than a chore. Thank God.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(14, 14);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Collider", 14, '2018-10-19');

INSERT INTO Critic (name) VALUES
("Liz Shannon Miller"); # reviewerID 15
INSERT INTO Publication (publicationName) VALUES
("IndieWire");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, null, 1, 3); # reviewID 15
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(15, "'Daredevil' Season 3 Review: A Return to Basics Puts Netflix's MCU Back on Target",
"The show may never have the spark it did in its earliest days,
but it did help elevate the way stories of superheroes can be told on television.
There's still progress to be made, but \"Daredevil\" feels like it's on the right track.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(15, 15);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IndieWire", 15, '2018-10-20');

INSERT INTO Critic (name) VALUES
("Carrie Wittmer"); # reviewerID 16
INSERT INTO Publication (publicationName) VALUES
("Business Insider");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(76, null, 1, 3); # reviewID 16
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(16, "'Daredevil' season 3 takes a lot of risks and as a result
is one of the best seasons of Netflix's Marvel shows",
"For a chunk of the season, the main characters barely interact with each other.
It's one of the reasons why the season works.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(16, 16);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Business Insider", 16, '2018-10-19');

INSERT INTO Critic (name) VALUES
("Lauren O'Callaghan"); # reviewerID 17
INSERT INTO Publication (publicationName) VALUES
("GamesRadar+");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, null, 1, 3); # reviewID 17
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(17, "Daredevil season 3 review: 'Sees the show return to top form'",
"While Daredevil season 3 gets off to a painfully slow start,
the Devil of Hell's Kitchen eventually hits his stride and
sees the show return to top form.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(17, 17);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("GamesRadar+", 17, '2018-10-24');

INSERT INTO Critic (name) VALUES
("Shaan Joshi"); # reviewerID 18
INSERT INTO Publication (publicationName) VALUES
("We Got This Covered");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, null, 1, 3); # reviewID 18
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(18, "Daredevil Season 3 Review",
"While it's partly let down by its glacially-paced first three episodes,
Daredevil season 3 manages to find its footing before long.
Fans of the ongoing battle between Matt Murdock and Kingpin will not be disappointed.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(18, 18);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("We Got This Covered", 18, '2018-10-11');

# Daredevil S3E1
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Resurrection", '2018-10-19', 53, null); # programID 1

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(1, 1, 3, 1);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 1, '2018-10-19');

# Daredevil S3E1 crew
INSERT INTO CrewPerson (name, birthdate) VALUES
("Charlie Cox", '1982-12-15'); # crewID 1
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 1, "Main cast", "Matt Murdock");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Deborah Ann Woll", '1985-2-7'); # crewID 2
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 2, "Main cast", "Karen Page");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Elden Henson", '1977-8-30'); # crewID 3
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 3, "Main cast", "Foggy Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Joanne Whalley", '1961-8-25'); # crewID 4
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 4, "Main cast", "Sister Maggie");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jay Ali", '1982-3-29'); # crewID 5
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 5, "Main cast", "Ray Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Vincent D'Onofrio", '1959-6-30'); # crewID 6
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 6, "Main cast", "Wilson Fisk");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Peter McRobbie", '1943-1-31'); # crewID 7
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 7, "Guest cast", "Father Lantom");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Danny Johnson", null); # crewID 8
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 8, "Guest cast", "Benjamin Donovan");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Stephen Rowe", null); # crewID 9
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 9, "Guest cast", "Nicholas Lee");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Kate Udall", null); # crewID 10
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sunita Deshpande", null); # crewID 11
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 11, "Guest cast", "Seema Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Noah Huq", null); # crewID 12
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 12, "Guest cast", "Sami Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Fajer Kaisi", null); # crewID 13
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 13, "Guest cast", "Nihar Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Nandita Shenoy", null); # crewID 14
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 14, "Guest cast", "Saanvi Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dina Shihabi", null); # crewID 15
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 15, "Guest cast", "Neda Kazemi");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Chris Colombo", null); # crewID 16
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 16, "Guest cast", "Mr. Kazemi");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jarrett Worley", null); # crewID 17
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 17, "Guest cast", "Kidnapper");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jaxon Folds", null); # crewID 18
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 18, "Guest cast", "Orphan #1");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Cheikh Tairou M'Baye", null); # crewID 19
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 19, "Guest cast", "Orphan #2");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Zenzi Williams", null); # crewID 20
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 20, "Guest cast", "Nun");

INSERT INTO CrewPerson (name, birthdate) VALUES
("John Patrick O'Keefe", null); # crewID 21
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 21, "Guest cast", "Taxi Driver");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Evan Dane Taylor", null); # crewID 22
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 22, "Guest cast", "Boxer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Erik Oleson", '1973-2-7'); # crewID 23
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 23, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Marc Jobst", null); # crewID 24
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 24, "Director", "Directed By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Lewaa Nasserdeen", null); # crewID 25
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 25, "Producer", "Co-Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sonay Hoffman", null); # crewID 27
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 26, "Producer", "Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Evan Perazzo", null); # crewID 27
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 27, "Crew", "Unit Production Manager");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tamara Becher-Wilkinson", null); # crewID 28
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 28, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dara Resnik", null); # crewID 29
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 29, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sam Ernst", null); # crewID 30
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 30, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jim Dunn", null); # crewID 31
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 31, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Alan Fine", null); # crewID 32
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 32, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Joe Quesada", '1962-1-12'); # crewID 33
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 33, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Stan Lee", '1922-12-28'); # crewID 34
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 34, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Karim Zreik", null); # crewID 35
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 35, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Drew Goddard", '1975-2-26'); # crewID 36
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 36, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jim Chory", null); # crewID 37
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 37, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jeph Loeb", '1958-1-29'); # crewID 38
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 38, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tom Lieber", null); # crewID 39
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 39, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("James Sodini", null); # crewID 40
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 40, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Matthew O'Brien", null); # crewID 41
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 41, "Producer", "Co-Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Holly Rymon", null); # crewID 42
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 42, "Producer", "Co-Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Laray Mayfield", null); # crewID 43
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 43, "Crew", "Casting By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Julie Schubert", null); # crewID 44
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 44, "Crew", "Casting By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tonya Kong", null); # crewID 45
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 45, "Crew", "Story Editor");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jonathan Shoemaker", null); # crewID 46
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 46, "Crew", "Unit Production Manager");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tony Philippe", null); # crewID 47
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 47, "Crew", "First Assistant Director");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Kelly Mahoney", null); # crewID 48
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 48, "Crew", "Second Assistant Director");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Christopher LaVasseur", null); # crewID 49
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 49, "Crew", "Director of Photography");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Michael N. Knue", null); # crewID 50
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 50, "Crew", "Edited By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("John Paesano", '1977-7-2'); # crewID 51
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(1, 51, "Crew", "Music By");

# Daredevil S3E1 reviews
INSERT INTO Critic (name) VALUES
("Scott Collura"); # reviewerID 19
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 1, null, null); # reviewID 19
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(19, "Daredevil Season 3 Premiere Review",
"Daredevil's return in the Season 3 premiere of the Netflix series is a
strong outing for both Matt Murdock and Charlie Cox, as new showrunner Erik Oleson
reorients the Man Without Fear to very much be full of fear and obstacles as he
attempts to climb his way out of the debris of everything that has come before.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(19, 19);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 19, '2018-10-12');

INSERT INTO Critic (name) VALUES
("Caroline Siede"); # reviewerID 20
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, 1, null, null); # reviewID 20
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(20, "Daredevil's stripped-down third season premiere tackles cataclysms and catechisms",
"Fisk doesn't have a ton to do in this Matt-centric premiere, but just seeing Vincent
D'Onofrio back in the role with the promise of more to come is hugely exciting.
For now, however, Olseson is content to slowly rebuild the world of the show rather
than rushing to add a whole bunch of new elements at once.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 20);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 20, '2018-10-19');

INSERT INTO Critic (name) VALUES
("Divij Sonak"); # reviewerID 21
INSERT INTO Publication (publicationName) VALUES
("Appocalypse");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 1, null, null); # reviewID 21
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(21, "Daredevil Season 3 Episode 1 Review – Resurrection",
"Unlike most other Marvel or Netflix shows (save for probably The Punisher),
Daredevil starts strong and grips you right from the beginning.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 21);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 21, '2018-10-20');

INSERT INTO Critic (name) VALUES
("Joshua Rivera"); # reviewerID 22
INSERT INTO Publication (publicationName) VALUES
("Vulture");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(40, 1, null, null); # reviewID 22
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(22, "Daredevil Recap: Back in Black, Still a Sad Sack",
"All that grim, overwrought stuff you might feel apprehensive about? It's here.
That is what roughly 80 percent of this 52-minute premiere is concerned with,
and it's all quite boring.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 22);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 22, '2018-10-19');

INSERT INTO Critic (name) VALUES
("Tiago Fiszbejn"); # reviewerID 23
INSERT INTO Publication (publicationName) VALUES
("MCU Exchange");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null); # reviewID 23
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(23, "REVIEW: 'Daredevil' Season 3 Episode 1 - Resurrection",
"The first episode of season three gives us everything we were hoping for
and a little extra on top of that.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(23, 23);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 23, '2018-10-19');

INSERT INTO Critic (name) VALUES
("Jeffrey Lyles"); # reviewerID 24
INSERT INTO Publication (publicationName) VALUES
("Lyles Movie Files");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 1, null, null); # reviewID 24
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(24, "Daredevil Season 3 Episode 1 – Resurrection review",
"Resurrection avoided showy action and quick attention span storytelling.
We're in for a good meal — it's just time now to let it marinate and see
how it all comes together.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 24);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 24, '2018-10-19');

INSERT INTO Critic (name) VALUES
("Steven Bynoe"); # reviewerID 25
INSERT INTO Publication (publicationName) VALUES
("Comix Asylum");
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 1, null, null); # reviewID 25
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(25, "Review: Marvel's Daredevil 301 – Resurrection",
"The majority of the premiere is set up, but it works well,
not only to allow new viewers to get up to speed but to let long time
viewers refamiliarize themselves with the show's complex cast of characters.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 25);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 25, '2018-10-19');

# Daredevil S3E2
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Please", '2018-10-19', 50, null); # programID 2

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(2, 1, 3, 2);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 2, '2018-10-19');

# Daredevil S3E2 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 5, "Main cast", "Ray Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Wilson Bethel", null); # crewID 52
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 52, "Guest cast", "Benjamin 'Dex' Poindexter");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Stephen Rider", null); # crewID 53
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 53, "Guest cast", "Blake Tower");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 7, "Guest cast", "Father Lantom");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Geoffrey Cantor", null); # crewID 54
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 54, "Guest cast", "Mitchell Ellison");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Skylar Gaertner", null); # crewID 55
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 55, "Guest cast", "Young Matt");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Matthew McCurdy", null); # crewID 56
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 56, "Guest cast", "Agent Wellers");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Matt DeAngelis", null); # crewID 57
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 57, "Guest cast", "Jasper Evans");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Deirdre O'Connell", null); # crewID 58
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 58, "Guest cast", "Anna Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Michael Mulheren", null); # crewID 59
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 59, "Guest cast", "Edward Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Peter Halpin", '1984-4-23'); # crewID 60
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 60, "Guest cast", "Theo Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("John Francis McNamara", null); # crewID 61
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 61, "Guest cast", "Uncle Timmy Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Anne Carney", null); # crewID 62
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 62, "Guest cast", "Aunt Jeanie Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Arden Wolfe", null); # crewID 63
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 63, "Guest cast", "Nelson Niece");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jonathan O'Reilly", null); # crewID 64
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 64, "Guest cast", "Nelson Nephew");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Andy Lucien", null); # crewID 65
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 65, "Guest cast", "Agent Ramsey");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Don Castro", null); # crewID 66
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 66, "Guest cast", "Agent Arinori");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Bill Winkler", null); # crewID 67
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 67, "Guest cast", "Warden Riggle");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 15, "Guest cast", "Neda Kazemi");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 16, "Guest cast", "Mr. Kazemi");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Antoni Corone", null); # crewID 68
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 68, "Guest cast", "Police Commissioner Chris DiMolina");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Anabel Graetz", null); # crewID 69
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 69, "Guest cast", "Old Albanian Woman");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ron Fehmiu", null); # crewID 70
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 70, "Guest cast", "Albanian Mob Boss");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Martin Chavez", null); # crewID 71
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 71, "Guest cast", "Man");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Elisabeth Ness", null); # crewID 72
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 72, "Guest cast", "Young Mother");

INSERT INTO CrewPerson (name, birthdate) VALUES
("James Foster Jr.", null); # crewID 73
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 73, "Guest cast", "Old Man");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Oliver Palmer", null); # crewID 74
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 74, "Guest cast", "Delivery Guy");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 17, "Guest cast", "Dry Cleaner / Kidnapper");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Gavin Haag", null); # crewID 75
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 75, "Guest cast", "EMT");

INSERT INTO CrewPerson (name, birthdate) VALUES
("DeShawn Harold Mitchell", null); # crewID 76
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 76, "Guest cast", "Agent #1");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Patrick Cann", null); # crewID 77
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 77, "Guest cast", "Agent #2");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ari Blinder", null); # crewID 78
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(2, 78, "Guest cast", "Agent #3");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Lukas Ettlin", null); # crewID 79
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 79, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 31, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 40, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Bryce Garcia", null); # crewID 80
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 80, "Producer", "Co-Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Margaret Scarpello", null); # crewID 81
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 81, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 46, "Crew", "Unit Production Manager");

INSERT INTO CrewPerson (name, birthdate) VALUES
("David 'Wex' Wechsler", null); # crewID 82
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 82, "Crew", "First Assistant Director");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Logan Wolfe Edler", null); # crewID 83
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 83, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 49, "Crew", "Director of Photography");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jonathan Chibnall", null); # crewID 84
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 84, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(2, 51, "Crew", "Music By");

# Daredevil S3E2 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(81, 2, null, null); # reviewID 26
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(26, "Daredevil Season 3, Episode 2: \"Please\" Review",
"Episode 2 drags in the beginning, but picks up
with the introduction of Bullseye in the final moments.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 26);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 26, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, 2, null, null); # reviewID 27
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(27, "Daredevil's characters may feel lost, but the show's third season is right on track",
"Here Oleson and episode writer Jim Dunn offer an entirely different kind of
action sequence that better captures the spirit of that original Daredevil calling card.
His characters may be struggling to find their purpose, but so far Oleson seems
to know exactly what he's doing.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 27);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 27, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 2, null, null); # reviewID 28
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(28, "Daredevil Season 3 Episode 2 Review: Please",
"While Marvel Netflix shows are generally infamous for being a slow burn,
it's great to see Daredevil at least try bucking the trend.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 28);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 28, '2018-10-21');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 2, null, null); # reviewID 29
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(29, "Daredevil Recap: Matt Murdock Has an Attitude Problem",
"It's only a slight exaggeration to say that this season of Daredevil
could have just started here — while the setup of the premiere did feel necessary,
its execution didn't really come with much in the way of compelling hooks,
or threads that could be spun into compelling plot lines that
we'd be following this season.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 29);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 29, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null); # reviewID 30
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(30, "REVIEW: 'Daredevil' Season 3 Episode 2 - Please",
"Episode two of the third season of Daredevil is as solid as the first one.
The difference, however, is that \"Please\" takes Matt out of the spotlight
for most of its run, and gives some solid screen time for the rest of the cast to shine.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(23, 30);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 30, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null); # reviewID 31
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(31, "Daredevil Season 3 E2 – Please review",
"Please was a terrific episode as it's taking a more mature approach on faith and destiny,
featured a great Kingpin scene and the foreshadowing of a major player in the Daredevil canon.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 31);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 31, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 2, null, null); # reviewID 25
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(32, "Review: Marvel's Daredevil 302 – Please",
"The new season is taking its time, setting the table for what is to come.
With so many interesting characters in the mix the pacing is on point
letting the intrigue build around them like a slowly clenching fist.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 32);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 32, '2018-10-19');

# Daredevil S3E3
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("No Good Deed", '2018-10-19', 50, null); # programID 3

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(3, 1, 3, 3);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 3, '2018-10-19');

# Daredevil S3E3 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 53, "Main cast", "Blake Tower");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 54, "Guest cast", "Mitchell Ellison");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Amy Rutberg", '1981-11-11'); # crewID 85
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 85, "Guest cast", "Marci Stahl");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 8, "Guest cast", "Benjamin Donovan");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 9, "Guest cast", "Nicholas Lee");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 11, "Guest cast", "Seema Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Max Baker", null); # crewID 86
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 86, "Guest cast", "Dr. Myman");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Holly Cinnamon", null); # crewID 87
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 87, "Guest cast", "Julie Barnes");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Meredith Salenger", null); # crewID 88
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 88, "Guest cast", "Lily Ellison");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Chris Carfizzi", null); # crewID 89
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 89, "Guest cast", "Jason Ellison");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Scotty Crowe", null); # crewID 90
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 90, "Guest cast", "Agent Lim");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 56, "Guest cast", "Agent Wellers");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 66, "Guest cast", "Agent Arinori");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Richard Prioleau", null); # crewID 91
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 91, "Guest cast", "Agent Doyle");

INSERT INTO CrewPerson (name, birthdate) VALUES
("David Anthony Buglione", '1977-7-15'); # crewID 92
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 92, "Guest cast", "Agent Johnson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Josiah Nolan", null); # crewID 93
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 93, "Guest cast", "Agent Mockta");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sam Slater", null); # crewID 94
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 94, "Guest cast", "Agent O'Connor");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Toni Di Buono", null); # crewID 95
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 95, "Guest cast", "Arlene");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Anna Reichert", null); # crewID 96
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 96, "Guest cast", "Vexed Cop");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Bruce Faulk", null); # crewID 97
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 97, "Guest cast", "Installer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dan Mason", null); # crewID 98
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 98, "Guest cast", "Wealthy Guest");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Josh Evans", null); # crewID 99
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(3, 99, "Guest cast", "Hotel Staffer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jennifer Getzinger", null); # crewID 100
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 100, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 26, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 81, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 47, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 48, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 49, "Crew", "Director of Photography");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jesse Ellis", null); # crewID 101
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 101, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(3, 51, "Crew", "Music By");

# Daredevil S3E3 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null); # reviewID 33
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(33, "Daredevil Season 3, Episode 3: \"No Good Deed\" Review",
"Karen and Foggy get to shine while Matt is bogged down by an imaginary Kingpin.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 33);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 33, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(81, 3, null, null); # reviewID 34
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(34, "Visions haunt Matt Murdock as Daredevil plays around with perspective",
"The dialogue in this episode is notably clunkier than in the previous two
(and those weren't perfect to begin with). Still, an innovative action setpiece
and an intriguing new character help pepper over some weaknesses in the execution.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 34);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 34, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 3, null, null); # reviewID 35
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(35, "Daredevil Season 3 Episode 3 Review: No Good Deed",
"It's amazing how well-connected the third episode of Daredevil Season 3 is.
Where most shows would develop multiple subplots, No Good Deed rests on the
singular story development of Wilson Fisk having been transferred to house arrest.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 35);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 35, '2018-10-21');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 3, null, null); # reviewID 36
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(36, "Daredevil Recap: Matt Lets the Devil Out",
"The only real, genuine thing we can anchor dread over Fisk in is his history
with the core cast members. It's a good thing then that this episode chooses
to show all three of them responding to Fisk's release in their own ways.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 36);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 36, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null); # reviewID 37
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(37, "REVIEW: 'Daredevil' Season 3 Episode 3 - No Good Deed",
"It was a very good episode to get to know what could be the show's
next antagonist, Dex. The rest of the plots, however, didn't seem to move a lot.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(23, 37);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 37, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null); # reviewID 38
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(38, "Daredevil S3 E3 – No Good Deed review",
"No Good Deed had a few missteps, but some moments and a signature
terrific fight scene helped make for another exciting episode.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 38);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 38, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 3, null, null); # reviewID 39
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(39, "Review: Marvel's Daredevil 303 – No Good Deed",
"No Good Deed raises some moral questions and some of the answers aren't pretty.
Difficult questions indeed and how the series sets out to resolve them will
be interesting especially now that Daredevil's presence has been brought to Fisk's attention.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 39);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 39, '2018-10-19');

# Daredevil S3E4
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Blindsided", '2018-10-19', 54, null); # programID 4

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(4, 1, 3, 4);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 4, '2018-10-19');

# Daredevil S3E4 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 85, "Guest cast", "Marci Stahl");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Royce Johnson", null); # crewID 102
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 102, "Guest cast", "Brett Mahoney");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 11, "Guest cast", "Seema Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Luke Robertson", null); # crewID 103
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 103, "Guest cast", "Michael Kemp");

INSERT INTO CrewPerson (name, birthdate) VALUES
("James Biberi", null); # crewID 104
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 104, "Guest cast", "Vic Jusufi");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Andrew Sensenig", null); # crewID 105
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 105, "Guest cast", "Agent Winn");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 90, "Guest cast", "Agent Lim");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 91, "Guest cast", "Agent Doyle");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Malikha Mallette", null); # crewID 106
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 106, "Guest cast", "FDIC Field Supervisor Tanya Mills");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Danny Garcia", null); # crewID 107
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 107, "Guest cast", "Malik");

INSERT INTO CrewPerson (name, birthdate) VALUES
("David Roberts", null); # crewID 108
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 108, "Guest cast", "Nurse Oscar");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Joseph Edwards", null); # crewID 109
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 109, "Guest cast", "Front Guard");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Perry Strong", null); # crewID 110
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 110, "Guest cast", "Corrections Officer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Lance Channing", null); # crewID 111
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 111, "Guest cast", "Entrance Guard");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Afrim Gjonbalaj", null); # crewID 112
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 112, "Guest cast", "Albanian Inmate");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dave Macomber", null); # crewID 113
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 113, "Guest cast", "Spying Inmate");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Adam Wood", null); # crewID 114
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 114, "Guest cast", "Albanian Guard");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Daron Ross", null); # crewID 115
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 115, "Guest cast", "Rowdy Officer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Bryan Reynoso", null); # crewID 116
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 116, "Guest cast", "Thug #1");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jonathan Iglesias", null); # crewID 117
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 117, "Guest cast", "Lanky Thug");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jake Eavey", null); # crewID 118
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(4, 118, "Guest cast", "Cabbie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Alex Garcia Lopez", null); # crewID 119
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 119, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 25, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 40, "Producer", "Co-Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Mary-Margaret Kunze", null); # crewID 120
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 120, "Producer", "Co-Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Melissa Morkus", null); # crewID 121
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 121, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 82, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 83, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 50, "Crew", "Edited By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Trey Ordoñez", null); # crewID 122
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 122, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(4, 51, "Crew", "Music By");

# Daredevil S3E4 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(91, 4, null, null); # reviewID 40
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(40, "Daredevil Season 3, Episode 4: \"Blindsided\" Review",
"Matt's trip to the prison is a much-needed shot of adrenaline
that overcomes the episode's bloat.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 40);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 40, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, 4, null, null); # reviewID 41
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(41, "Daredevil's latest one-take fight sequence is riotously cool",
"The one-take action is actively woven into the episode's narrative rather
than feeling like a moment where Daredevil pauses its storytelling for an action scene.
If I have one critique, it's that the sequence does lack just a little bit of emotional heft.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 41);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 41, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(95, 4, null, null); # reviewID 42
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(42, "Daredevil Season 3 Episode 4 Review: Blindsided",
"It's easy to see where the cuts could be but that doesn't make the brutality
of it any less effective. By now, it appears the crew behind the show have
mastered the ins and outs of planning such a sequence.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 42);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 42, '2018-10-22');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null); # reviewID 43
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(43, "Daredevil Recap: In Hallways, We Have Fights",
"It's 10 brutal minutes of escalating violence and desperation, raising the stakes
as Matt gets closer to his goal. Doubly impressive is the fact that director Alex
Garcia López and crew decided to pull this off with Matt out-of-costume.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 43);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 43, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null); # reviewID 44
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(44, "REVIEW: 'Daredevil' Season 3 Episode 4 - Blindsided",
"The prison sequence is the highlight of this episode, and perhaps of the whole season.
So far, this fourth one is easlily the best of the season, and one of the best of
the whole Marvel/Netflix partnership.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(23, 44);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 44, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(95, 4, null, null); # reviewID 45
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(45, "Daredevil S3 E4 – Blindsided review",
"Blindsided delivered big time with an epic fight scene and Fisk asserting his control.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 45);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 45, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null); # reviewID 46
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(46, "Review: Marvel's Daredevil 304 – Blindsided",
"One of the highlights of the episode is Matt's escape from the prison riot
and it evokes memories of a memorable one-shot scene from the first season of True Detective.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 46);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 46, '2018-10-19');

# Daredevil S3E5
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Perfect Game", '2018-10-19', 49, null); # programID 5

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(5, 1, 3, 5);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 5, '2018-10-19');

# Daredevil S3E5 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 8, "Guest cast", "Benjamin Donovan");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 60, "Guest cast", "Theo Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 87, "Guest cast", "Julie Barnes");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Joe Jones", null); # crewID 123
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 123, "Guest cast", "Felix Manning");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Heidi Armbruster", null); # crewID 124
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 124, "Guest cast", "Dr. Eileen Mercer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Cameron Mann", null); # crewID 125
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 125, "Guest cast", "Young Dex");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Conor Proft", null); # crewID 126
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 126, "Guest cast", "Teenage Dex");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Gary Hilborn", null); # crewID 127
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 127, "Guest cast", "Coach Bradley");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dennis Carnegie", null); # crewID 128
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 128, "Guest cast", "Agent Fremont");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 92, "Guest cast", "Agent Johnson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Venida Evans", null); # crewID 129
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 129, "Guest cast", "Mrs. Callahan");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ethel Fisher", null); # crewID 130
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 130, "Guest cast", "Mrs. Wobschall");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Frank G. Rivers", null); # crewID 131
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(5, 131, "Guest cast", "Umpire");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Julian Holmes", null); # crewID 132
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 132, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 41, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 42, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 45, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 47, "Crew", "First Assistant Director");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Maurice Sessoms", null); # crewID 133
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 133, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 48, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 84, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(5, 51, "Crew", "Music By");

# Daredevil S3E5 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(78, 5, null, null); # reviewID 47
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(47, "Daredevil Season 3, Episode 5: \"The Perfect Game\" Review",
"The focus on Bullseye's backstory slows down the plot,
but offers much-needed insight into a fascinating character.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 47);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 47, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 5, null, null); # reviewID 48
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(48, "Daredevil channels an artsy student film as it puts its villains front and center",
"As someone with a high tolerance for stylized storytelling, I didn't totally hate it.
But I didn't totally love it either. Mostly, I find it really strange that this
season of Daredevil keeps introducing these new stylistic elements that only
seem to last for a single episode.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 48);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 48, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null); # reviewID 49
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(49, "Daredevil Season 3 Episode 5 Review: The Perfect Game",
"Daredevil continues to deliver one knockout episode after another and
this one's no different. If anything, it's one of the most pivotal
episodes in that it introduces us to the enigma that is Agent Dex,
in hopes of making us see his point of view.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 49);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 49, '2018-10-22');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null); # reviewID 50
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(50, "Daredevil Recap: The Origin of Benjamin Poindexter",
"All told, it's an upsetting, effective portrait that finds ways to be both 
subtler than the show's ever been at times and also terribly on the nose in others.
It's also, to boot, the most experimental and dramatic non-action sequence the series 
has ever attempted. It's good!");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 50);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 50, '2018-10-21');

INSERT INTO Critic (name) VALUES
("KJ Callahan"); # reviewerID 26
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 5, null, null); # reviewID 51
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(51, "REVIEW: 'Daredevil' Season 3 Episode 5 - The Perfect Game",
"Bullseye's story was everything I wanted it to be. They're not trying to downplay
his craziness a la Typhoid in Season 2 of Iron Fist.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(26, 51);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 51, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(95, 5, null, null); # reviewID 52
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(52, "Daredevil S3 E5 – The Perfect Game review",
"After the previous action-packed episode, The Perfect Game cools things down a
bit for an immensely satisfying character-driven episode. It was so good that I
didn't realize Matt was barely in it. That's the beauty of having such a strong
supporting cast.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 52);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 52, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null); # reviewID 53
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(53, "Review: Marvel's Daredevil 305 – The Perfect Game",
"For an episode that's incredibly light on Matt Murdock screen time his stake
in the narrative has gone through the roof. With Pointdexter on the precipice
of becoming one of Daredevil's iconic villains and Matt now a fugitive of the
law, The Perfect Game has all of the chess pieces in place for Season 3 to really take off.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 53);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 53, '2018-10-19');

# Daredevil S3E6
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Devil You Know", '2018-10-19', 54, null); # programID 6

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(6, 1, 3, 6);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 6, '2018-10-19');

# Daredevil S3E6 cast
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 54, "Guest cast", "Mitchell Ellison");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 123, "Guest cast", "Felix Manning");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 9, "Guest cast", "Nicholas Lee");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 105, "Guest cast", "OPR Agent Winn");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Kimberli Alexis Flores", null); # crewID 134
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 134, "Guest cast", "Agent Alvarez");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 57, "Guest cast", "Jasper Evans");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Marcus Antturi", null); # crewID 135
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 135, "Guest cast", "Elton Evans");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Libby George", null); # crewID 136
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 136, "Guest cast", "Old Lady Evans");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 92, "Guest cast", "Agent Johnson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 94, "Guest cast", "Agent O'Connor");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Corey Pierno", null); # crewID 137
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 137, "Guest cast", "Reporter #3");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Brandon Morris", null); # crewID 138
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(6, 138, "Guest cast", "NYPD Detective");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Stephen Surjik", null); # crewID 139
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 139, "Director", "Directed By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dylan Gallagher", null); # crewID 140
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 140, "Writer", "Written By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 120, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 81, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 82, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 83, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 101, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(6, 51, "Crew", "Music By");

# Daredevil S3E6 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(91, 6, null, null); # reviewID 54
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(54, "Daredevil Season 3, Episode 6: \"The Devil You Know\" Review",
"Matt begins to rediscover his friends in this episode and realizes that they
work better as a team than him being stubborn and solo. But those meager warm
feelings of healing get violently interrupted by Fisk's new deadly weapon! This is a savagely
delicious way to mark the season's (almost) halfway mark.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 54);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 54, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 6, null, null); # reviewID 55
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(55, "A game-changing fight scene delivers Daredevil v Daredevil: Dawn Of Injustice",
"There's a real \"anything can happen\" energy to the Bulletin fight, much more
so than in the cool but predictable prison riot sequence.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 55);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 55, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null); # reviewID 56
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(56, "Daredevil Season 3 Episode 6 Review: The Devil You Know",
"In short, Season 3 of Daredevil is proving to be an absolute blast at this point
and the only place it can go from here I'm afraid is downhill. For now, I'm fully
in on a rogue Daredevil and watching Matt chop up his lawyer skills to prove his
innocence could be an interesting development to anticipate in the upcoming episodes.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 56);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 56, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 6, null, null); # reviewID 57
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(57, "Daredevil Recap: Matt Murdock, Meet Daredevil",
"The ensuing fight is my favorite one in Daredevil so far, a wonderfully gripping
setpiece that's small yet explosive, a well-choreographed bout between a couple of
soon-to-be-nemeses. It's a fight where you can see both characters trying to figure
each other out, each surprised by the other's talents.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 57);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 57, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 6, null, null); # reviewID 58
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(58, "REVIEW: 'Daredevil' Season 3 Episode 6 - The Devil You Know",
"The whole fight was top notch stuff, but I can't get over the fact that it absolutely
made no sense for Jasper to have been there to begin with and the fact that Bullseye's
character seemed to snap a little too quickly.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(26, 58);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 58, '2018-10-24');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null); # reviewID 59
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(59, "Daredevil S3E6 – The Devil You Know review",
"Director Stephen Surjik reimagines Bullseye like a stalking horror movie villain
with pinpoint ricochet talent that even catches Matt off guard. Our first Bullseye/
Daredevil encounter more than lives up to the hype and is every bit as physical and
brutal as anything we've seen in the season so far.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 59);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 59, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null); # reviewID 60
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(60, "Review: Marvel's Daredevil 306 – The Devil You Know",
"When Fisk's master move and hidden chess piece finally comes into view it sets
up a brutal showdown that viewers have been waiting for and rewards long-time
fans of the Daredevil comics.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 60);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 60, '2018-10-19');

# Daredevil S3E7
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Aftermath", '2018-10-19', 50, null); # programID 7

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(7, 1, 3, 7);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 7, '2018-10-19');

# Daredevil S3E7 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 54, "Guest cast", "Mitchell Ellison");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 85, "Guest cast", "Marci Stahl");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 11, "Guest cast", "Seema Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 12, "Guest cast", "Sami Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Lee Tergesen", null); # crewID 141
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 141, "Guest cast", "Paxton Page");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Matt Gerald", null); # crewID 142
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 142, "Guest cast", "Melvin Potter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 9, "Guest cast", "Nicholas Lee");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 56, "Guest cast", "Agent Wellers");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 123, "Guest cast", "Felix Manning");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Karina Casiano", null); # crewID 143
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 143, "Guest cast", "Betsy Beatty");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 14, "Guest cast", "Saanvi Nadeem");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Kelly McAndrew", null); # crewID 144
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 144, "Guest cast", "Mrs. Shelby");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 91, "Guest cast", "Agent Doyle");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Antu Yacob", null); # crewID 145
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 145, "Guest cast", "Carla");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 67, "Guest cast", "Warden Riggle");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 92, "Guest cast", "Agent Johnson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Christopher Piccione", null); # crewID 146
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 146, "Guest cast", "Parolee");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Marlie Hall", null); # crewID 147
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 147, "Guest cast", "Reporter #1");

INSERT INTO CrewPerson (name, birthdate) VALUES
("John Carey", null); # crewID 148
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 148, "Guest cast", "Reporter #2");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Anthony Salvador Lewis", null); # crewID 149
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 149, "Guest cast", "Reporter #3");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Amy Halldin", null); # crewID 150
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 150, "Guest cast", "Reporter #4");

INSERT INTO CrewPerson (name, birthdate) VALUES
("David Healy", null); # crewID 151
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(7, 151, "Guest cast", "Reporter #5");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Toa Fraser", null); # crewID 152
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 152, "Director", "Directed By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sarah Streicher", null); # crewID 153
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 153, "Writer", "Written By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 41, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 81, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 47, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 48, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 50, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(7, 51, "Crew", "Music By");

# Daredevil S3E7 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(84, 7, null, null); # reviewID 61
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(61, "Daredevil Season 3, Episode 7: \"Aftermath\" Review",
"Episode 7 actually gives our heroes some solid ground in an hour
full of plot development and very little bloat.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 61);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 61, '2018-10-24');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(75, 7, null, null); # reviewID 62
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(62, "Daredevil doesn't realize Wilson Fisk is less interesting the more powerful he becomes",
"In the first season, Fisk was a powerful crime lord who was nevertheless
struggling to establish the full reach of his power. Now he's a full-on
all-seeing supervillain, and I have no idea how we got here.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 62);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 62, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 7, null, null); # reviewID 63
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(63, "Daredevil Season 3 Episode 7 Review: Aftermath",
"Now Nadeem may appear as a sidekick or an ordinary detective, but you have to
understand that he's more than just that. His introduction at the show's premiere
episode itself suggested strongly that this is a full-fledged supporting character
and it shows in how he handles Matt's appearance.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 63);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 63, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 7, null, null); # reviewID 64
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(64, "Daredevil Recap: A Table Full of Unanswered Phones",
"As exciting as the Daredevil-on-Daredevil brawl of \"The Devil You Know\" was,
it was also immediately preceded by a shockingly violent slaughter of innocent people,
one that marked a pivotal moment in this story. In a single shot, those deaths are felt.
And honestly? I needed a minute.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 64);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 64, '2018-10-26');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 7, null, null); # reviewID 65
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(65, "REVIEW: 'Daredevil' Season 3 Episode 7 - Aftermath",
"Nadeem's arc has gotten more interesting, and we got a decent fight scene and, but,
other than that, this felt like no more than a solid bridge episode.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(26, 65);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 65, '2018-10-25');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 7, null, null); # reviewID 66
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(66, "Daredevil: Season 3 E7 Aftermath review",
"Aftermath kept my interest with another solid episode that dealt with the fallout
of one of the season's most riveting installments yet.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 66);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 66, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null); # reviewID 67
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(67, "Review: Marvel's Daredevil 307 – Aftermath",
"Seven episodes into Season 3 of Daredevil, with the way the show has combined all
of the best elements of the comic book and adapted them into a tense drama with
brutal fight scenes, it's become clear that this is Marvel and Netflix's equivalent
to what Christopher Nolan brought to the Batman mythos.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 67);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 67, '2018-10-20');

# Daredevil S3E8
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Upstairs/Downstairs", '2018-10-19', 50, null); # programID 8

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(8, 1, 3, 8);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 8, '2018-10-19');

# Daredevil S3E8 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 53, "Main cast", "Blake Tower");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 123, "Guest cast", "Felix Manning");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 87, "Guest cast", "Julie Barnes");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Francis Benhamou", null); # crewID 154
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 154, "Guest cast", "Andrea Morales");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 90, "Guest cast", "Agent Lim");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 56, "Guest cast", "Agent Wellers");

INSERT INTO CrewPerson (name, birthdate) VALUES
("David Walcott", null); # crewID 155
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 155, "Guest cast", "Richie");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Bill Buell", null); # crewID 156
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 156, "Guest cast", "Mr. Gerlach");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Brett Eidman", null); # crewID 157
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 157, "Guest cast", "Mikey");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Angel Rosa", null); # crewID 158
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 158, "Guest cast", "NYPD Officer #1");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Abena Mensah-Bonsu", null); # crewID 159
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 159, "Guest cast", "NYPD Officer #2");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Anthony Mecca", null); # crewID 160
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 160, "Guest cast", "Tall Painter");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Benjamin Hinnant", null); # crewID 161
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(8, 161, "Guest cast", "Short Painter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Alex Zakrzewski", null); # crewID 162
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 162, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 29, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 120, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 121, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 82, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 83, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 84, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(8, 51, "Crew", "Music By");

# Daredevil S3E8 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(86, 8, null, null); # reviewID 68
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(68, "Daredevil Season 3, Episode 8: \"Upstairs/Downstairs\" Review",
"\"Upstairs/Downstairs\" is a busy, intense, and rewarding episode that showcases all
our heroes battling back against Fisk, in their own way, and getting thwarted because
he's always several steps ahead of them.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 68);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 68, '2018-10-24');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(78, 8, null, null); # reviewID 69
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(69, "Daredevil needlessly retreads old ground before finally moving things forward",
"I wouldn't dismiss these past two episodes as just filler, because I've
liked some of the character developments that have happened within them.
But they feel like episodes where Daredevil is focusing on plot over theme,
and I tend to care about the latter way more than the former, at least on this show.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 69);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 69, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null); # reviewID 70
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(70, "Daredevil Season 3 Episode 8 Review: Upstairs / Downstairs",
"That's some wickedly cunning scheming out there and if you needed any more reason
as to why Fisk is one of the best antagonists and villains in comic-book filmmaking
right now, look no further. He's better than most Marvel Cinematic Universe villains
and shall hold a special place for years to come.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(21, 70);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Appocalypse", 70, '2018-10-25');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 8, null, null); # reviewID 71
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(71, "Daredevil Recap: Karen vs. Fisk",
"We haven't seen Dex since \"The Devil You Know,\" and while his attack on the
Bulletin seems to suggest that he's fully pivoted to being a remorseless killer,
\"Upstairs/Downstairs\" shows that's not entirely true.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 71);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 71, '2018-10-29');

INSERT INTO Critic (name) VALUES
("Alex Lurie"); # reviewerID 27
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 8, null, null); # reviewID 72
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(72, "REVIEW: 'Daredevil' Season 3 Episode 8 - Upstairs/Downstairs",
"There was a great balance between Matt and Nadeem investigating Dex and the
plot line with and Foggy and Karen planning to take on Fisk.
Both were incredibly tense and very well acted.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(27, 72);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 72, '2018-10-26');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 8, null, null); # reviewID 73
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(73, "Daredevil Season 3 E8 Upstairs/Downstairs review",
"I'm proud of how the writers are handling Ray. He's not that bumbling, idiot law
enforcement agent who's another obstacle when he should be an ally. Upstairs/Downstairs
puts him squarely on Team Devil as he works with Matt to get Dex out of his house so
they can check it.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 73);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 73, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 8, null, null); # reviewID 74
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(74, "Review: Marvel's Daredevil 308 – Upstairs/Downstairs",
"One of the most pivotal scenes in Upstairs/Downstairs is the faceoff between Karen
and Fisk. It's a great scene with a slow boil of back and forth jabs until the
verbal punches become haymakers with damage taken on both sides.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 74);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 74, '2018-10-20');

# Daredevil S3E9
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Revelations", '2018-10-19', 54, null); # programID 9

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(9, 1, 3, 9);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 9, '2018-10-19');

# Daredevil S3E9 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 7, "Guest cast", "Father Lantom");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 85, "Guest cast", "Marci Stahl");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 123, "Guest cast", "Felix Manning");

INSERT INTO CrewPerson (name, birthdate) VALUES
("John Patrick Hayden", null); # crewID 163
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 163, "Guest cast", "Jack Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 105, "Guest cast", "OPR Agent Winn");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Annabella Sciorra", '1960-3-29'); # crewID 164
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 164, "Guest cast", "Rosalie Carbone");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 58, "Guest cast", "Anna Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 59, "Guest cast", "Edward Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 60, "Guest cast", "Theo Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 11, "Guest cast", "Seema Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 12, "Guest cast", "Sami Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 137, "Guest cast", "Mrs. Shelby");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Isabella Pisacane", null); # crewID 165
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 165, "Guest cast", "Novitiate Maggie");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Macaulee Rusnak Cassaday", null); # crewID 166
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 166, "Guest cast", "Novitiate Ingrid");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ammie Montas", null); # crewID 167
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 167, "Guest cast", "Novitiate Ellen");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 61, "Guest cast", "Uncle Timmy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 62, "Guest cast", "Aunt Jeanie Nelson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ezra Knight", null); # crewID 168
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 168, "Guest cast", "John Hammer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ned Van Zandt", null); # crewID 169
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 169, "Guest cast", "Everett Starr");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Cori Dioquino", null); # crewID 170
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 170, "Guest cast", "Sophia Carter");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Stephen Axelrod", null); # crewID 171
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 171, "Guest cast", "Latimer Zyl");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Kelsey Schmitt", null); # crewID 172
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 172, "Guest cast", "Allison Hattley");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Keet Davis", null); # crewID 173
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 173, "Guest cast", "The Mark");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 56, "Guest cast", "Agent Wellers");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 66, "Guest cast", "Agent Arinori");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 65, "Guest cast", "Agent Ramsey");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 134, "Guest cast", "Agent Alvarez");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 91, "Guest cast", "Agent Doyle");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 92, "Guest cast", "Agent Johnson");

INSERT INTO CrewPerson (name, birthdate) VALUES
("John Nania", null); # crewID 174
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 174, "Guest cast", "Agent Markham");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 94, "Guest cast", "Agent O'Connor");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Omar Corominas", null); # crewID 175
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 175, "Guest cast", "Fight Referee");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 64, "Guest cast", "Nelson Nephew");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 63, "Guest cast", "Nelson Niece");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Che' Tafari", null); # crewID 176
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(9, 176, "Guest cast", "Marcus");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 23, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jennifer Lynch", null); # crewID 177
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 177, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 30, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 41, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 42, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 47, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 48, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 101, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(9, 51, "Crew", "Music By");

# Daredevil S3E9 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, 9, null, null); # reviewID 75
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(75, "Daredevil Season 3, Episode 9: \"Revelations\" Review",
"Despite rolling credits right when the stakes skyrocket and the action's
about to start, \"Revelations\" is a wonderful wheelbarrow full of hard-to-swallow
truths and mind-bending answers. It put Fisk's full power on display while also
turning Agent Nadeem into someone to actively root for.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 75);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 75, '2018-10-25');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(88, 9, null, null); # reviewID 76
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(76, "Some major revelations get Daredevil's third season back on track",
"Like the premiere, “Revelations” is an episode that puts Matt front and center
by exploring his complicated relationship to both Catholicism and parental figures.
But the episode also continues the expansive, ensemble-based storytelling that's been
a highlight of the rest of the season too.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 76);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 76, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 9, null, null); # reviewID 78
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(77, "Daredevil Recap: Out of the Past",
"One of the fascinating things about the third season of Daredevil is how it's
translated the narrative of Born Again to make sense in this version of the Daredevil story.
In many ways, it improves on the source material, making more thoughtful choices than
the original comic did.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 77);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 77, '2018-10-30');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 9, null, null); # reviewID 78
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(78, "REVIEW: 'Daredevil' Season 3 Episode 9 - Revelations",
"This episode did a great job dealing with the fallout from the last episode.
The visual of seeing the FBI obeying Fisk sends a very powerful message and
makes him even more intimidating.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(27, 78);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 78, '2018-10-27');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(95, 9, null, null); # reviewID 79
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(79, "Daredevil: S3 E9 Revelations review",
"Revelations was an incredible episode of Daredevil's third season.
The title was applicable for both Matt Murdock and Wilson Fisk for two
completely different reasons. And it also showed why Wilson Fisk is one
of the MCU's best villains.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 79);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 79, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null); # reviewID 80
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(80, "Review: Marvel's Daredevil 309 – Revelations",
"Everyone's eyes are opened in Revelations. From Matt to Foggy to Karen to Nadeem,
the true scope of what they are facing shakes the very foundation of their worlds.
Even the Kingpin's clandestine meeting at the conclusion of the episode startles
the rest of the underworld, evoking memories of one of the most iconic scenes
from The Untouchables.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 80);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 80, '2018-10-27');

# Daredevil S3E10
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Karen", '2018-10-19', 46, null); # programID 10

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(10, 1, 3, 10);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 10, '2018-10-19');

# Daredevil S3E10 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 7, "Guest cast", "Father Lantom");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 134, "Guest cast", "Paxton Page");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jack DiFalco", null); # crewID 178
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 178, "Guest cast", "Kevin Page");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Will Stout", null); # crewID 179
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 179, "Guest cast", "Todd");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 137, "Guest cast", "Mrs. Shelby");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Monica Lian Bell", null); # crewID 180
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 180, "Guest cast", "Ruby");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Robert Vincent Smith", null); # crewID 181
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 181, "Guest cast", "Chief Bernie");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Gregg Prosser", null); # crewID 182
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 182, "Guest cast", "Jake");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jordon Bolden", null); # crewID 183
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 183, "Guest cast", "Emo Senior");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Nicholas Wey", null); # crewID 184
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(10, 184, "Guest cast", "Sweatshirt Student");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 23, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 119, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 28, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 30, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 120, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 81, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 82, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 83, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 50, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(10, 51, "Crew", "Music By");

# Daredevil S3E10 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 10, null, null); # reviewID 81
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(81, "Daredevil Season 3, Episode 10: \"Karen\" Review",
"Here we're given a lengthy flashback featuring a hefty and heartbreaking
performance by Deborah Ann Woll, that isn't so greedy that it takes up the
whole episode, and a super sick church battle between iconic comic book foes.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 81);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 81, '2018-10-19');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(81, 10, null, null); # reviewID 82
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(82, "A grim Daredevil needs to talk about Kevin... and Karen",
"What we learn about Karen in this extended flashback to her youth complicates what
we know about her, yet also feels apiece with both the character as we know her
today and with the various plot threads that have been left dangling over the years.
As an episode in its own right, however, \"Karen\" has some pretty big flaws.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 82);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 82, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 10, null, null); # reviewID 83
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(83, "Daredevil Recap: The Origin of Karen Page",
"The episode feels like an overreach, but an admirable one —
the show wants to do right by a character it hasn't been the best with,
but it's not entirely earned.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 83);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 83, '2018-11-3');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 10, null, null); # reviewID 84
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(84, "REVIEW: 'Daredevil' Season 3 Episode 10 - Karen",
"This episode did a great job with both the character heavy opening that delves
into Karen's past as well as the fight sequence at the end. And the payoff was
everything we could have asked for. It was well written, beautifully acted,
and incredibly tragic.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(27, 84);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 84, '2018-10-28');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 10, null, null); # reviewID 85
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(85, "Daredevil: Season 3 E10 Karen review",
"This was another highly entertaining episode that provided some useful
backstory for Karen and delivered on another brutal Daredevil/Bullseye battle.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 85);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 85, '2018-10-21');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 10, null, null); # reviewID 86
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(86, "Review: Marvel's Daredevil 310 – Karen",
"Karen looks at the masks we all wear in a bid to hide the ugly sides of our true selves.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 86);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 86, '2018-10-28');

# Daredevil S3E11
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Reunion", '2018-10-19', 50, null); # programID 11

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(11, 1, 3, 11);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 11, '2018-10-19');

# Daredevil S3E11 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 7, "Guest cast", "Father Lantom");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Lesley Ann Warren", null); # crewID 185
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 185, "Guest cast", "Esther Falb");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 8, "Guest cast", "Benjamin Donovan");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 102, "Guest cast", "Brett Mahoney");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 9, "Guest cast", "Nicholas Lee");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 60, "Guest cast", "Theo Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 11, "Guest cast", "Seema Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 12, "Guest cast", "Sami Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 56, "Guest cast", "Agent Wellers");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 92, "Guest cast", "Agent Johnson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 66, "Guest cast", "Agent Arinori");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Adriana Santos", null); # crewID 186
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 186, "Guest cast", "Young Nun");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Carleton King", null); # crewID 187
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 187, "Guest cast", "Officer Minelli");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ron Simons", null); # crewID 188
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 188, "Guest cast", "NYPD Captain Strieber");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Britt Sanborn", null); # crewID 189
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 189, "Guest cast", "NYPD Cop");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Matthew Streeter", null); # crewID 190
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 190, "Guest cast", "NYPD ESU Leader");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Candice Tiffany Gordon", null); # crewID 191
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(11, 191, "Guest cast", "NYPD Crime Scene Tech");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jet Wilkinson", null); # crewID 192
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 192, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 29, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 31, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 41, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 42, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 47, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 48, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 84, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(11, 51, "Crew", "Music By");

# Daredevil S3E11 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(86, 11, null, null); # reviewID 87
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(87, "Daredevil Season 3, Episode 11: \"Reunion\" Review",
"It's mostly a stationary search-and-rescue mission, but a crowd-pleasing one
that doesn't hammer us over the head with too much chatter about Matt's lapsing morality.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 87);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 87, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 11, null, null); # reviewID 88
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(88, "Daredevil is at its best when it's letting its main characters
actually talk to each other",
"Charlie Cox and Deborah Ann Woll have a great, lived-in sense of chemistry by now,
and watching them hang out and chat was so much more compelling than much of the stuff that's
happened elsewhere this season. That goes double once they eventually bring Foggy in as well.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 88);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 88, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 11, null, null); # reviewID 89
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(89, "Daredevil Recap: Hey Matt, Remember Your Friends?",
"Daredevil can't build momentum to save its life. Why does it have a baffling
compulsion to follow up its show-stopper episodes by... stopping the show? ");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 89);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 89, '2018-11-04');

INSERT INTO Critic (name) VALUES
("Curtis Johnson"); # reviewerID 28
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null); # reviewID 90
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(90, "REVIEW: 'Daredevil' Season 3 Episode 11 - Reunion",
"This was yet another great episode to add to the roster. It is jam-packed with great
character moments and intensity.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(28, 90);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 90, '2018-10-29');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null); # reviewID 91
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(91, "Daredevil: Season 3 E11 Reunion review",
"Reunion quietly showed that Daredevil has paid attention to some of the
mistakes from its Marvel Netflix peers.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 91);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 91, '2018-10-22');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 11, null, null); # reviewID 92
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(92, "Review: Marvel's Daredevil 311 – Reunion",
"Reunion serves as a bit of a course correction with law enforcement and Matt, Karen
and Foggy teaming up to begin punching back against Fisk. The Kingpin's trademark
outbursts also make a welcome return but his moment with Esther Falb, played by Lesley
Anne Warren, is the pivotal scene of the episode.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 92);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 92, '2018-10-28');

# Daredevil S3E12
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("One Last Shot", '2018-10-19', 55, null); # programID 12

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(12, 1, 3, 12);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 12, '2018-10-19');

# Daredevil S3E12 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 53, "Main cast", "Blake Tower");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 6, "Main cast", "Wilson Fisk");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ayelet Zurer", '1969-6-28'); # crewID 193
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 193, "Guest cast", "Vanessa Marianna");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 54, "Guest cast", "Mitchell Ellison");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 102, "Guest cast", "Brett Mahoney");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sharon Hope", null); # crewID 194
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 194, "Guest cast", "Mrs. Mahoney");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 11, "Guest cast", "Seema Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 123, "Guest cast", "Felix Manning");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 137, "Guest cast", "Mrs. Shelby");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 12, "Guest cast", "Sami Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 92, "Guest cast", "Agent Johnson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 66, "Guest cast", "Agent Arinori");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Dion Sapp", null); # crewID 195
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 195, "Guest cast", "Plainclothes Cop");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Anthony M. Bertram", null); # crewID 196
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 196, "Guest cast", "Bailiff");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tanya Rivero", null); # crewID 197
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 197, "Guest cast", "Tabloid Journalist");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Duarte Geraldino", null); # crewID 198
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 198, "Guest cast", "TV Reporter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 142, "Guest cast", "Reporter #2");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Robyn Payne", null); # crewID 199
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 199, "Guest cast", "Reporter #3");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Frank Gallo", null); # crewID 200
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 200, "Guest cast", "Grand Juror #1");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Estelle Lee", null); # crewID 201
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 201, "Guest cast", "Grand Juror #3");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jonathan Fielding", null); # crewID 202
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(12, 202, "Guest cast", "Terrified Juror");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Phil Abraham", null); # crewID 203
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 203, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 30, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 120, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 121, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 82, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 83, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 101, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(12, 51, "Crew", "Music By");

# Daredevil S3E12 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 12, null, null); # reviewID 93
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(93, "Daredevil Season 3, Episode 12: \"One Last Shot\" Review",
"Given how little time's left in Season 3, \"One Last Shot\" spends a bit
too much time rooting around in Agent Nadeem's sorrow. But it still makes
for an exciting ride, and drop off point, leading into the finale.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 93);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 93, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(85, 12, null, null); # reviewID 94
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(94, "Daredevil's penultimate episode reunites the avocados",
"But that doesn't make it any easier to watch the tragedy of Ray Nadeem unfold
before our eyes. Before all that however, \"One Last Shot\" recaptures a lot of
what made season one of Daredevil so great.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 94);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 94, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 12, null, null); # reviewID 95
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(95, "Daredevil Recap: Nelson and Murdock Ride Again",
"The only reason \"One Last Shot\" works in spite of its well-trod ground is because it
mostly functions as the tragic conclusion of Agent Rahul Nadeem's story.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 95);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 95, '2018-11-6');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 12, null, null); # reviewID 96
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(96, "REVIEW: 'Daredevil' Season 3 Episode 12 - One Last Shot",
"After an episode dedicated to moving the plot along verbally and focusing
on dialogue and character moments, I expected a much more explosive episode.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(28, 96);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 96, '2018-10-30');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(95, 12, null, null); # reviewID 97
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(97, "Daredevil Season 3 E12 One Last Shot review",
"Daredevil's third season found a lot of clarity with its penultimate episode.
One Last Shot was an amazing episode that put the final pieces in motion for
Daredevil's big showdown with Wilson Fisk.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 97);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 97, '2018-10-22');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null); # reviewID 98
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(98, "Review: Marvel's Daredevil 312 – One Last Shot",
"Vanessa's hold on Fisk, her ability to bring all his vulnerabilities to
the surface makes her an interesting addition to the final episodes of Season 3.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 98);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 98, '2018-11-4');

# Daredevil S3E13
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("A New Napkin", '2018-10-19', 54, null); # programID 13

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(13, 1, 3, 13);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 13, '2018-10-19');

# Daredevil S3E13 crew
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 1, "Main cast", "Matt Murdock");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 2, "Main cast", "Karen Page");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 3, "Main cast", "Foggy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 4, "Main cast", "Sister Maggie");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 5, "Main cast", "Ray Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 52, "Main cast", "Benjamin 'Dex' Poindexter");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 53, "Main cast", "Blake Tower");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 6, "Main cast", "Wilson Fisk");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 193, "Guest cast", "Vanessa Marianna");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 54, "Guest cast", "Mitchell Ellison");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 85, "Guest cast", "Marci Stahl");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 123, "Guest cast", "Felix Manning");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 102, "Guest cast", "Brett Mahoney");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 10, "Guest cast", "SAC Tammy Hattley");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 11, "Guest cast", "Seema Nadeem");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 164, "Guest cast", "Rosalie Carbone");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 137, "Guest cast", "Mrs. Shelby");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 168, "Guest cast", "John Hammer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 171, "Guest cast", "Latimer Zyl");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 87, "Guest cast", "Julie Barnes");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 9, "Guest cast", "Nicholas Lee");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 58, "Guest cast", "Anna Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 59, "Guest cast", "Edward Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 60, "Guest cast", "Theo Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 61, "Guest cast", "Uncle Timmy Nelson");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 194, "Guest cast", "Mrs. Mahoney");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 105, "Guest cast", "Agent Winn");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 90, "Guest cast", "Agent Lim");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 66, "Guest cast", "Agent Arinori");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 65, "Guest cast", "Agent Ramsey");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 91, "Guest cast", "Agent Doyle");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 94, "Guest cast", "Agent O'Connor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 174, "Guest cast", "Agent Markham");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Jon J. Masters", null); # crewID 204
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 204, "Guest cast", "Cardinal");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Glenn Kubota", null); # crewID 205
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 205, "Guest cast", "Dr. Oyama");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Amar Srivastava", null); # crewID 206
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 206, "Guest cast", "Surgeon");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 140, "Guest cast", "News Reporter");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Bobby Daniel Rodriguez", null); # crewID 207
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 207, "Guest cast", "ESU Officer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Marvin Bell", null); # crewID 208
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(13, 208, "Guest cast", "Band Leader");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 23, "Writer", "Written By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 23, "Producer", "Executive Producer");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Sam Miller", null); # crewID 209
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 209, "Director", "Directed By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 25, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 26, "Producer", "Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 27, "Producer", "Producer");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 27, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 28, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 29, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 30, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 31, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 32, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 33, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 34, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 35, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 36, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 37, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 38, "Producer", "Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 39, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 40, "Producer", "Co-Executive Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 41, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 42, "Producer", "Co-Producer");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 43, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 44, "Crew", "Casting By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 45, "Crew", "Story Editor");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 46, "Crew", "Unit Production Manager");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 47, "Crew", "First Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 48, "Crew", "Second Assistant Director");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 49, "Crew", "Director of Photography");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 50, "Crew", "Edited By");

INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES 
(13, 51, "Crew", "Music By");

# Daredevil S3E13 reviews
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(92, 13, null, null); # reviewID 99
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(99, "Daredevil Season 3, Episode 13: \"A New Napkin\" Finale Review",
"It perfectly uses Matt, Kingpin, and Bullseye for an incredible penthouse fight
that will drop your jaw and make you cringe. It's a very rewarding capper to a
season dominated by the return, and wretched rise, of Fisk.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(7, 99);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("IGN", 99, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(68, 13, null, null); # reviewID 100
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(100, "Daredevil’s third season finale totally misses the mark",
"How did Matt become so calm and well-adjusted? I have absolutely no idea!
Nothing within this season nor within this episode explains the chipper,
relaxed guy Matt has become by the end of this finale.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(20, 100);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("The A. V. Club", 100, '2018-10-20');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 13, null, null); # reviewID 101
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(101, "Daredevil Recap: Who Is the Real Man Without Fear?",
"Matt Murdock has never been allowed to simply be Daredevil, confident in his mission,
a man without fear. This is part of what has made season three so frustrating as it
wraps up: It’s out to deconstruct a character who has never really been that firmly
constructed to begin with.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(22, 101);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Vulture", 101, '2018-11-06');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null); # reviewID 102
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(102, "REVIEW: 'Daredevil' Season 3 Episode 13 - A New Napkin",
"Things get wrapped up very neatly and in a very hopeful and season 1-esque way.
I love that, though this was a very dark season and our heroes were really dragged
through the mud, things are still so optimistic in the end.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(28, 102);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("MCU Exchange", 102, '2018-10-31');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null); # reviewID 103
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(103, "Daredevil Season 3 E13 A New Napkin review",
"Daredevil Season 3 was every bit as epic as expected. A New Napkin was a terrific
conclusion to this season that doesn't need any cliffhangers or stunts to have
viewers on edge waiting for news of a fourth installment.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(24, 103);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Lyles Movie Files", 103, '2018-10-23');

INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 13, null, null); # reviewID 104
INSERT INTO CriticReview (reviewID, title, textExcerpt) VALUES
(104, "Review: Marvel's Daredevil 313 – A New Napkin",
"A New Napkin is a fitting conclusion to another satisfying season of Marvel's Daredevil.
It not only did justice to one of the Man Without Fear’s iconic storylines,
but it also added a new layer of depth to its characters.");
INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
(25, 104);
INSERT INTO Publishes (publicationName, reviewID, date) VALUES
("Comix Asylum", 104, '2018-11-4');

# Arrow S7
INSERT INTO Platform (name, isNetwork) VALUES
("CW", true); # platformID 2

INSERT INTO Serial (name) VALUES
("Arrow"); # serialID 2

INSERT INTO Season (serialID, seasonID, orderingPlatformID, announceDate, renewed) VALUES
(2, 7, 2, '2018-4-2', null);

# Arrow S7E1
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Inmate 4587", '2018-10-15', 54, null); # programID 14

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(14, 2, 7, 1);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-15', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-15', '20:00:00', 14, 1.43, 0.4, 0.7, 0.8);

# Arrow S7E2
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Longbow Hunters", '2018-10-22', 54, null); # programID 15

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(15, 2, 7, 2);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-22', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-22', '20:00:00', 15, 1.18, 0.4, 0.6, null);

# Arrow S7E3
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Crossing Lines", '2018-10-29', 54, null); # programID 16

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(16, 2, 7, 3);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-29', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-29', '20:00:00', 16, 1.15, 0.4, 0.6, null);

# Arrow S7E4
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Level Two", '2018-11-5', null, null); # programID 17

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(17, 2, 7, 4);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-11-5', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-11-5', '20:00:00', 17, 1.08, 0.3, null, null);

# Arrow S7E5
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Demon", '2018-11-12', null, null); # programID 18

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(18, 2, 7, 5);

# Arrow S7E6
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Due Process", '2018-11-19', null, null); # programID 19

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(19, 2, 7, 6);

# Arrow S7E7
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Slabside Redemption", '2018-11-26', null, null); # programID 20

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(20, 2, 7, 7);

# The Flash S5
INSERT INTO Serial (name) VALUES
("The Flash"); # serialID 3

INSERT INTO Season (serialID, seasonID, orderingPlatformID, announceDate, renewed) VALUES
(3, 5, 2, '2018-4-2', null);

# The Flash S5E1
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Nora", '2018-10-9', 54, null); # programID 21

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(21, 3, 5, 1);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-9', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-9', '20:00:00', 21, 2.08, 0.8, 1.4, 0.8);

# The Flash S5E2
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("Blocked", '2018-10-16', 54, null); # programID 22

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(22, 3, 5, 2);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-16', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-16', '20:00:00', 22, 1.69, 0.7, 1.1, 1.3);

# The Flash S5E3
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Death of Vibe", '2018-10-23', 54, null); # programID 23

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(23, 3, 5, 3);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-23', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-23', '20:00:00', 23, 1.87, 0.7, 1.2, null);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-10-31', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-10-31', '20:00:00', 23, 1.75, 0.7, 1.1, null);

# The Flash S5E4
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("News Flash", '2018-11-5', null, null); # programID 24

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(24, 3, 5, 4);

INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
(2, '2018-11-06', '20:00:00');

INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, dayOfShare,
livePlusThree, livePlusSeven) VALUES
(2, '2018-11-06', '20:00:00', 24, 1.08, 0.3, null, null);

# The Flash S5E5
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("All Doll'd Up", '2018-11-13', null, null); # programID 25

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(25, 3, 5, 5);

# The Flash S5E6
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Icicle Cometh", '2018-11-20', null, null); # programID 26

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(26, 3, 5, 6);

# The Flash S5E7
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("O Come, All Ye Faithful", '2018-11-27', null, null); # programID 27

INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
(27, 3, 5, 7);

# The Ballad of Buster Scruggs
INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
("The Ballad of Buster Scruggs", '2018-11-16', 133, null); # programID 28

INSERT INTO Film (progID) VALUES
(28);

INSERT INTO Stream (platformID, progID, releaseDate) VALUES
(1, 28, '2018-11-16');

INSERT INTO CrewPerson (name, birthdate) VALUES
("James Franco", '1978-4-19'); # crewID 210
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 210, "Main cast", "Cowboy");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Brendan Gleeson", '1955-3-29'); # crewID 211
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 211, "Main cast", "Irishman");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Zoe Kazan", '1983-9-9'); # crewID 212
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 212, "Main cast", "Alice Longabaugh");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Liam Neeson", '1952-6-7'); # crewID 213
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 213, "Main cast", "Impersario");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tim Blake Nelson", '1964-5-11'); # crewID 214
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 214, "Main cast", "Buster Scruggs");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Tom Waits", '1949-12-7'); # crewID 215
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 215, "Main cast", "Prospector");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Joel Coen", '1954-11-29'); # crewID 216
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 216, "Director", "Directed By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 216, "Writer", "Written By");

INSERT INTO CrewPerson (name, birthdate) VALUES
("Ethan Coen", '1957-9-21'); # crewID 217
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 217, "Director", "Directed By");
INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
(28, 217, "Writer", "Written By");

INSERT INTO Award(awardOrganization, awardName, date) VALUES
("Venice International Film Festival", "Best Screenplay", '2018-8-31');
INSERT INTO AwardForProgram(awardOrganization, awardName, date, progID, won) VALUES
("Venice International Film Festival", "Best Screenplay", '2018-8-31', 28, TRUE);
INSERT INTO AwardForProgramForCrewPerson(awardOrganization, 
	awardName, date, progID, crewID) VALUES
("Venice International Film Festival", "Best Screenplay", '2018-8-31', 28, 216);
INSERT INTO AwardForProgramForCrewPerson(awardOrganization, 
	awardName, date, progID, crewID) VALUES
("Venice International Film Festival", "Best Screenplay", '2018-8-31', 28, 217);

INSERT INTO Award(awardOrganization, awardName, date) VALUES
("Venice International Film Festival", "Golden Lion", '2018-8-31');
INSERT INTO AwardForProgram(awardOrganization, awardName, date, progID, won) VALUES
("Venice International Film Festival", "Golden Lion", '2018-8-31', 28, FALSE);
INSERT INTO AwardForProgramForCrewPerson(awardOrganization, 
	awardName, date, progID, crewID) VALUES
("Venice International Film Festival", "Golden Lion", '2018-8-31', 28, 216);
INSERT INTO AwardForProgramForCrewPerson(awardOrganization, 
	awardName, date, progID, crewID) VALUES
("Venice International Film Festival", "Golden Lion", '2018-8-31', 28, 217);

INSERT INTO Award(awardOrganization, awardName, date) VALUES
("Adelaide Film Festival", "Best Feature", '2018-10-12');
INSERT INTO AwardForProgram(awardOrganization, awardName, date, progID, won) VALUES
("Adelaide Film Festival", "Best Feature", '2018-10-12', 28, FALSE);
INSERT INTO AwardForProgramForCrewPerson(awardOrganization, 
	awardName, date, progID, crewID) VALUES
("Adelaide Film Festival", "Best Feature", '2018-10-12', 28, 216);
INSERT INTO AwardForProgramForCrewPerson(awardOrganization, 
	awardName, date, progID, crewID) VALUES
("Adelaide Film Festival", "Best Feature", '2018-10-12', 28, 217);

# User ratings
INSERT INTO User (ip) VALUES
('100.182.60.216');
INSERT INTO User (ip) VALUES
('95.7.228.104');
INSERT INTO User (ip) VALUES
('77.60.67.197');
INSERT INTO User (ip) VALUES
('146.59.126.22');
INSERT INTO User (ip) VALUES
('210.194.174.255');
INSERT INTO User (ip) VALUES
('97.4.141.240');
INSERT INTO User (ip) VALUES
('236.210.225.96');
INSERT INTO User (ip) VALUES
('209.120.252.215');
INSERT INTO User (ip) VALUES
('100.19.89.123');
INSERT INTO User (ip) VALUES
('183.229.7.51');
INSERT INTO User (ip) VALUES
('173.138.119.52');
INSERT INTO User (ip) VALUES
('34.72.251.219');
INSERT INTO User (ip) VALUES
('17.172.107.2');
INSERT INTO User (ip) VALUES
('60.47.245.47');
INSERT INTO User (ip) VALUES
('184.70.187.87');
INSERT INTO User (ip) VALUES
('115.50.47.131');
INSERT INTO User (ip) VALUES
('198.33.247.32');
INSERT INTO User (ip) VALUES
('75.150.11.51');
INSERT INTO User (ip) VALUES
('195.13.150.151');
INSERT INTO User (ip) VALUES
('171.4.121.173');
INSERT INTO User (ip) VALUES
('91.87.80.144');
INSERT INTO User (ip) VALUES
('109.198.175.139');
INSERT INTO User (ip) VALUES
('184.95.215.42');
INSERT INTO User (ip) VALUES
('68.43.241.229');
INSERT INTO User (ip) VALUES
('56.217.18.19');

# Daredevil S3E1
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(105, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(106, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(107, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(108, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(109, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(110, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(111, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(112, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(113, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(114, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(115, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(116, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(117, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(118, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(119, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(120, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(121, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(122, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(123, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 1, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(124, 10);

# Daredevil S3E2
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(125, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(126, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(127, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(128, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(129, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(130, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(131, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(132, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(133, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(134, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(135, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(136, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(137, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(138, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(139, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(140, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(141, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(142, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(143, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 2, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(144, 10);

# Daredevil S3E3
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(145, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(146, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(147, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(148, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(149, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(150, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(151, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(152, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(153, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(154, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(155, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(156, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(157, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(158, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(159, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(160, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(161, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(162, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(163, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 3, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(164, 11);

# Daredevil S3E4
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(165, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(166, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(167, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(168, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(169, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(170, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(171, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(172, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(173, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(174, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(175, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(176, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(177, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(178, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(179, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(180, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(181, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(182, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(183, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 4, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(184, 2);

# Daredevil S3E5
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(185, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(186, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(187, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(188, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(189, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(190, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(191, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(192, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(193, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(194, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(195, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(196, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(197, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(198, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(199, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(200, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(201, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(202, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(203, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 5, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(204, 5);

# Daredevil S3E6
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(205, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(206, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(207, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(208, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(209, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(210, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(211, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(212, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(213, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(214, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(215, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(216, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(217, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(218, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(219, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(220, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(221, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(222, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(223, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 6, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(224, 20);

# Daredevil S3E7
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(225, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(226, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(227, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(228, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(229, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(230, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(231, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(232, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(233, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(234, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(235, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(236, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(237, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(238, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(239, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(240, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(241, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(242, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(243, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 7, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(244, 20);

# Daredevil S3E8
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(245, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(246, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(247, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(248, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(249, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(250, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(251, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(252, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(253, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(254, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(255, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(256, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(257, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(258, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(259, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(260, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(261, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(262, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(263, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 8, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(264, 18);

# Daredevil S3E9
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(265, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(266, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(267, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(268, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(269, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(270, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(271, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(272, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(273, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(274, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(275, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(276, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(277, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(278, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(279, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(280, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(281, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(282, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(283, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 9, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(284, 13);

# Daredevil S3E10
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(285, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(286, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(287, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(288, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(289, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(290, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(291, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(292, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(293, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(294, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(295, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(296, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(297, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(298, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(299, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(300, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(301, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(302, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(303, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 10, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(304, 5);

# Daredevil S3E11
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(305, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(306, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(307, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(308, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(309, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(310, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(311, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(312, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(313, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(314, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(315, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(316, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(317, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(318, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(319, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(320, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(321, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(322, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(323, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 11, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(324, 14);

# Daredevil S3E12
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(325, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(326, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(327, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(328, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(329, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(330, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(331, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(332, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(333, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(334, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(335, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(336, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(337, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(338, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(339, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(340, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(341, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(342, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(343, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 12, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(344, 7);

# Daredevil S3E13
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(345, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(346, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(347, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(348, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(349, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(350, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(351, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(352, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(353, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(354, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(355, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(356, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(357, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(358, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(359, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(360, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(361, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(362, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(363, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 13, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(364, 8);

# Arrow S7E1
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(365, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(366, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(367, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(368, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(369, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(370, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(371, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(372, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(373, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(374, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(375, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(376, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(377, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(378, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(379, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(380, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(381, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(382, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(383, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 14, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(384, 7);

# Arrow S7E2
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(385, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(386, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(387, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(388, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(389, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(390, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(391, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(392, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(393, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(394, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(395, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(396, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(397, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(398, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(399, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(400, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(401, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(402, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(403, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 15, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(404, 9);

# Arrow S7E3
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(405, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(406, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(407, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(408, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(409, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(410, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(411, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(412, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(413, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(414, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(415, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(416, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(417, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(418, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(419, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(420, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(421, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(422, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(423, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 16, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(424, 16);

# Arrow S7E4
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(425, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(426, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(427, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(428, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(429, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(430, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(431, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(432, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(433, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(434, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(435, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(436, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(437, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(438, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(439, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(440, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(441, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(442, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(443, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 17, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(444, 13);

# Arrow S7E5
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(445, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(446, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(447, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(448, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(449, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(450, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(451, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(452, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(453, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(454, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(455, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(456, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(457, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(458, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(459, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(460, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(461, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(462, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(463, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 18, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(464, 20);

# Arrow S7E6
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(465, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(466, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(467, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(468, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(469, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(470, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(471, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(472, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(473, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(474, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(475, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(476, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(477, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(478, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(479, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(480, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(481, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(482, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(483, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 19, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(484, 9);

# Arrow S7E7
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(485, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(486, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(487, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(488, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(489, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(490, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(491, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(492, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(493, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(494, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(495, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(496, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(497, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(498, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(499, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(500, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(501, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(502, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(503, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 20, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(504, 5);

# The Flash S5E1
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(505, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(506, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(507, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(508, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(509, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(510, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(511, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(512, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(513, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(514, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(515, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(516, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(517, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(518, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(519, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(520, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(521, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(522, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(523, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 21, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(524, 8);

# The Flash S5E2
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(525, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(526, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(527, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(528, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(529, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(530, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(531, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(532, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(533, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(534, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(535, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(536, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(537, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(538, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(539, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(540, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(541, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(542, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(543, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 22, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(544, 8);

# The Flash S5E3
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(545, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(546, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(547, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(548, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(549, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(550, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(551, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(552, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(553, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(554, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(555, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(556, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(557, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(558, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(559, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(560, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(561, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(562, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(563, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 23, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(564, 18);

# The Flash S5E4
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(565, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(566, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(567, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(568, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(569, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(570, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(571, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(572, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(573, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(574, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(575, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(576, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(577, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(578, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(579, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(100, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(580, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(581, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(582, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(583, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 24, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(584, 5);

# The Flash S5E5
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(585, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(586, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(587, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(588, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(589, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(590, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(591, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(592, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(593, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(594, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(595, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(596, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(597, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(598, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(599, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(600, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(601, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(602, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(603, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 25, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(604, 9);

# The Flash S5E6
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(605, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(606, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(607, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(608, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(609, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(610, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(611, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(612, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(613, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(614, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(615, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(616, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(617, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(618, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(619, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(620, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(621, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(622, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(623, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 26, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(624, 15);

# The Flash S5E7
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(625, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(626, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(627, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(628, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(629, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(630, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(631, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(632, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(633, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(634, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(635, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(636, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(637, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(638, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(639, 10);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(640, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(641, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(642, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(643, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 27, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(644, 17);

# The Ballad of Buster Scruggs
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(645, 12);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(646, 15);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(647, 3);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(648, 16);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(649, 2);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(80, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(650, 8);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(90, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(651, 5);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(652, 13);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(653, 20);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(654, 14);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(655, 18);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(656, 1);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(657, 7);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(658, 9);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(659, 11);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(660, 19);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(70, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(661, 6);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(40, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(662, 17);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(60, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(663, 4);
INSERT INTO Review (rating, progID, serialID, seasonID) VALUES
(50, 28, null, null);
INSERT INTO UserReview (reviewID, reviewerID) VALUES
(664, 10);