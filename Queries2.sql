USE miniinsta;

-- Let's check the tables are all okay.
SELECT * FROM comment;
SELECT * FROM following;
SELECT * FROM gender;
SELECT * FROM liking;
SELECT * FROM mediatype;
SELECT * FROM post;
SELECT * FROM postmedia;
SELECT * FROM user;

-- -----------------------------------------------------------------------------------------------------  
 
-- Analytical values as a single data set (each number as a separate column):
-- Didn't use AVG() function

SELECT
(SELECT count(id) from user) AS TotalNumberOfUsers, 
(SELECT count(id) from post) AS TotalNumberOfPosts, 
(SELECT TotalNumberOfPosts/TotalNumberOfUsers) AS AvgNumberOfPostsPerUser,
(SELECT count(UserID) from post GROUP BY UserID ORDER BY count(UserID) DESC LIMIT 1) AS MaxNumberOfPostsPerUser,
(SELECT (SELECT count(PostID) from liking) / TotalNumberOfPosts) AS AvgNumberOfLikesPerPost,
(SELECT count(PostID) from liking GROUP BY PostID ORDER BY count(PostID) DESC LIMIT 1) AS MaxNumberOfLikesPerPost;

-- -----------------------------------------------------------------------------------------------------  
-- Top 10 Users with most posts (in descending order of the number of posts)

SELECT post.UserID AS User_ID,
(SELECT count(UserID) from post WHERE user.id = post.UserID) AS NumberOfPosts,
(SELECT user.Username from user WHERE user.id = post.UserID) AS Username
from post INNER JOIN user ON user.id = post.UserID GROUP BY Username ORDER BY NumberOfPosts DESC LIMIT 10;

-- -----------------------------------------------------------------------------------------------------  
-- Number of user registrations by date (will return as many rows as there are unique dates)
-- There is no unique date...

SELECT DISTINCT substring_index(user.CreationTime, ' ', 1) AS Date,
(SELECT count(ID) from user GROUP BY Date) AS NumberOfRegistrations
from user;

-- User division by gender (should return 3 rows, one for each gender)
--

SELECT gender.Name AS GenderName,
(SELECT count(GenderID) from user WHERE user.GenderID = gender.ID GROUP BY GenderID) AS NumberOfUsers
 from gender;



