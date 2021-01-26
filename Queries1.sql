

-- Let's check the tables are all okay.
SELECT * FROM comment WHERE PostID = 165;
SELECT * FROM following;
SELECT * FROM gender;
SELECT * FROM liking;
SELECT * FROM mediatype;
SELECT * FROM post;
SELECT * FROM postmedia;
SELECT * FROM user;

-- -----------------------------------------------------------------------------------------------------  
 
-- FRONT PAGE (Seperate Queries)

-- Username, Post Upload Time, Amount of Likes
SELECT post.ID AS PostID, user.Username, post.CreationTime,
	(SELECT count(PostID) FROM liking WHERE PostID = post.id) AS NumberOfLikes
		FROM post INNER JOIN user ON post.UserID = user.ID;
  
       
-- Media files (all of them turned out to be photos...)
SELECT post.ID as PostID, postmedia.MediaTypeID, postmedia.MediaFileUrl
		FROM postmedia INNER JOIN post ON post.ID = PostID;
        
-- -----------------------------------------------------------------------------------------------------      
-- PROFILE PAGE

-- Main Query 

SELECT user.ID AS UserID, user.Username, user.Website, user.Bio, user.ProfileImageUrl,
(SELECT count(UserID) FROM post WHERE UserID = user.ID) AS NumberOfPosts,
(SELECT count(FolloweeUserID) FROM following WHERE FolloweeUserID = user.ID) AS NumberOfFollowers,
(SELECT count(FollowerUserID) FROM following WHERE FollowerUserID = user.ID) AS NumberOfFollowedUsers
FROM user;

-- Posts by the user, in chronologically descending order, **** EXAMPLE FOR USER 1 ***

SELECT post.ID as PostID, post.LocationName, postmedia.MediaTypeID, postmedia.MediaFileUrl
		FROM post INNER JOIN postmedia ON post.ID = PostID WHERE UserID=1 ORDER BY post.CreationTime DESC;

-- -----------------------------------------------------------------------------------------------------

-- POST DETAILS PAGE

-- Main Query  **** EXAMPLE FOR USER 1 CLICKING ON POST 165***

SELECT post.ID AS PostID, user.Username, user.ProfileImageUrl, post.LocationName, post.Location, 
(SELECT count(PostID) FROM liking WHERE PostID = post.id) AS NumberOfLikes
		FROM post INNER JOIN user ON Post.UserID = user.ID WHERE UserID=1 AND post.ID = 165;
        
-- Media files (in their natural order) **** EXAMPLE POST 165***

SELECT ID AS PostMediaID, MediaTypeID, MediaFileUrl FROM postmedia WHERE PostID = 165;

-- Comments in chronological order **** EXAMPLE POST 165***

SELECT ID AS CommentID, Comment, CreationTime FROM comment WHERE PostID = 165 ORDER BY CreationTime;
