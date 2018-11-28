-- need to add the search query constraints
-- View all programs released by a platform.

Select *
FROM program 
Where progID IN(
(SELECT distinct p.progID
FROM program p, broadcast b, platform plat
WHERE plat.isNetwork = TRUE and plat.platformID = b.platformID AND b.progID = p.progID) -- and b.name = _______
UNION 
(Select distinct p.progID
FROM program p, stream s, platform plat
WHERE plat.isNetwork = FALSE AND s.platformID = plat.platformID AND s.progID = p.progID)) -- and s.name = _____
;

-- (6) View all critic reviews and user ratings for a program.

SELECT criticreview.reviewID, criticreview.textExcerpt
FROM criticreview, review, program 
WHERE criticreview.reviewID = review.reviewID AND review.progID = program.progID;-- and program.progID = ______



SELECT AVG(review.rating) as theavgrating
FROM userreview, program, review
WHERE userreview.reviewID = review.reviewID AND program.progID = review.progID; -- and program.progID = ______

-- combine them if we want into a create table? 

-- (5) View all critic reviews (episode and season) and user ratings for a serial.

-- based on searching serial number 
SELECT DISTINCT criticreview.reviewID,  criticreview.textExcerpt
FROM criticreview, review, serial
WHERE criticreview.reviewID = review.reviewID AND serial.serialID = review.serialID;



-- gets all critic text and id based on season search 
SELECT DISTINCT criticreview.reviewID,  criticreview.textExcerpt
FROM criticreview, review, season, episode
WHERE criticreview.reviewID = review.reviewID AND season.seasonID = review.seasonID AND season.seasonID = 3; -- search term
;

-- (6) View all critic reviews for a season.
-- gets critic text and id based on episode search 
SELECT DISTINCT criticreview.reviewID, criticreview.textExcerpt
FROM criticreview, review, season, episode 
WHERE criticreview.reviewID = review.reviewID AND episode.seasonID = season.seasonID AND season.seasonID = review.seasonID AND episode.seasonID = 3 -- search term 

;

-- gets ratings based on season search         
SELECT AVG(review.rating) AS AverageRating
FROM userreview, review, episode, season
WHERE userreview.reviewID = review.reviewID AND season.seasonID = review.seasonID
;

-- gets ratings based on eprisode search 
SELECT AVG (review.rating) AS AverageUserRating 
FROM userreview, review, episode, season 
WHERE userreview.reviewID = review.reviewID AND season.seasonID = review.seasonID AND episode.seasonID = season.seasonID; -- add search term 


-- (5) View all critic reviews and user ratings for the programs that a crew person worked on.

SELECT DISTINCT criticreview.reviewID, criticreview.textExcerpt, program.name 
FROM criticreview, program, crewperson, workson, review
WHERE crewperson.crewID = workson.crewID AND workson.progID = program.progID AND review.progID = program.progID AND 
		review.reviewID = criticreview.reviewID AND crewperson.crewID = 81 -- search term 
;

SELECT AVG(review.rating) as Ratings, program.name as ProgramName
FROM userreview, program, crewperson, workson, review
WHERE crewperson.crewID = workson.crewID AND workson.progID = program.progID AND review.progID = program.progID AND 
		review.reviewID = userreview.reviewID AND crewperson.crewID = 81 -- search term; 
;

-- (5) View all critic reviews and user ratings for programs that aired on a particular network, a given broadcast schedule slot, or both.

SELECT DISTINCT criticreview.reviewID, criticreview.textExcerpt, program.name, broadcastschedule.date, p.name as platformname
FROM platform, criticreview, program, broadcastschedule, platform p, review
WHERE criticreview.reviewID = review.reviewID AND p.isNetwork = TRUE AND broadcastschedule.platformID = p.platformID;


SELECT AVG(review.rating), program.name, broadcastschedule.date, p.name as platformname
FROM platform, userreview, program, broadcastschedule, platform p, review
WHERE userreview.reviewID = review.reviewID AND p.isNetwork = TRUE AND broadcastschedule.platformID = p.platformID;

-- View all critic reviews written by a particular critic
Select DISTINCT criticreview.title, criticreview.textExcerpt, critic.name, review.reviewID
FROM criticreview, review, program p, critic, criticwrites
WHERE criticreview.reviewID = review.reviewID AND critic.reviewerID = criticwrites.reviewerID AND criticwrites.reviewID = criticreview.reviewID
	AND critic.name = "Divij Sonak" 
    ;
    Select DISTINCT criticreview.title, criticreview.textExcerpt, critic.name, review.reviewID
FROM criticreview, review, program p, critic, criticwrites
WHERE criticreview.reviewID = review.reviewID AND critic.reviewerID = criticwrites.reviewerID AND criticwrites.reviewID = criticreview.reviewID
	AND critic.name = "Divij Sonak" 
    ;

Select DISTINCT criticreview.title, criticreview.textExcerpt, critic.name, review.reviewID
FROM criticreview, review, program p, critic, criticwrites
WHERE criticreview.reviewID = review.reviewID AND critic.reviewerID = criticwrites.reviewerID AND criticwrites.reviewID = criticreview.reviewID
	AND critic.name = "Divij Sonak" 
    ;
    

    



