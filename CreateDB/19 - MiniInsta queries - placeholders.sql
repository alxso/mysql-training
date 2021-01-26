USE MiniInsta;

select * from User;

select * from User where ID = 191;

select * from User where Username = 'cbaccup3b';

-- --------------------------------------------------------
-- Front page query (posts by the people I follow, number of
-- likes for each post)
-- --------------------------------------------------------

 
 
-- --------------------------------------------------------
-- Profile page
-- Main portion: header with username, profile image, # of posts,
-- # of followers, # of followings, bio
-- Posts by this user in cronologically descending order, 
-- including one media file and # of total media files
-- --------------------------------------------------------
SET @Username = 'cbaccup3b';



-- --------------------------------------------------------
-- Post details
-- Main query: header info (username, profile picture, # of likes)
-- Media files
-- Comments
-- --------------------------------------------------------
SET @PostID = 74;



-- --------------------------------------------------------
-- Analytical numbers in single data set (total number of users, 
-- total number of posts, Average and max posts per user, 
-- avg and max comments per post, avg ja max likes per post
-- --------------------------------------------------------


----------------------------------------------------------
-- TOP 10 Users with most posts
----------------------------------------------------------


----------------------------------------------------------
-- User registration count per day
----------------------------------------------------------


----------------------------------------------------------
-- User division by gender
----------------------------------------------------------

