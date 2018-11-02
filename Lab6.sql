drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;
CREATE DATABASE LAB6;
/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);
ALTER TABLE Movie
    ADD PRIMARY KEY (mID);
ALTER TABLE Movie
    ADD unique (title,year);
ALTER TABLE Reviewer
    ADD PRIMARY KEY (rID);
ALTER TABLE Rating
    ADD UNIQUE (rID,mID,ratingDate);
ALTER TABLE Reviewer
    ADD CONSTRAINT  check_name check (name IS NOT NULL );
ALTER TABLE Rating
    ADD CONSTRAINT check_star check(stars IS NOT NULL );
ALTER TABLE Movie
    ADD CONSTRAINT check_year check (year>1900);
ALTER TABLE Rating
    ADD CONSTRAINT check_starsin check (stars in (1,2,3,4,5));
ALTER TABLE Rating
    ADD CONSTRAINT check_ratingdate CHECK(EXTRACT(YEAR FROM ratingDate)>2000);
SELECT *FROM pg_constraint;
/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');
UPDATE Movie SET mID=mID+1;
INSERT into Movie VAlUES(109,'Titanic',1997,'JC');
INSERT INTO Reviewer VALUES (201, 'Ted Codd');
UPDATE Rating set rID=205,mID=104;
INSERT INTO Reviewer VALUES(209,NULL);
UPDATE Rating set stars=NULL where RID=208;
UPDATE Movie set year=year-40;
UPDATE Rating SET stars=stars+1;
INSERT INTO Rating VALUES(201,101,1,'1999-01-01');
INSERT INTO Movie VAlues(109,'Titanic',2001, NULL);
UPDATE Rating SET mID=109;
UPDATE Rating set stars=stars-1;
ALTER TABLE Rating
    ADD FOREIGN KEY(rID) REFERENCES Reviewer(rID) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE Rating
    ADD FOREIGN KEY(mID) REFERENCES Movie(mID)ON DELETE CASCADE ;
INSERT INTO Rating VALUES(209,109,3,'2001-01-01');
UPDATE RATING set rID=209 where rid=208;
UPDATE Rating set mID=mID+1;
UPDATE Movie SET mId=109 WHERE mID=108;
UPDATE Movie SET mID=110 WHERE mID=105;
UPDATE Reviewer set rId=rId+10;
DELETE FROM Reviewer where rid>215;
DELETE FROM Movie where mID<105;
SELECT sum(rID) FROM Rating WHERE rID is not nUll;
SELECT count(*) From rating WHERE rID IS NULL;
SELECT * from Rating;