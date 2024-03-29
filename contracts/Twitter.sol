//SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

contract Twitter2 {

    uint16 public  MAX_TWEET_Length = 280;

    ///struct for the tweets
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    ///end struct


    //CODE
    mapping (address => Tweet[] ) public tweets;

    address public owner;

    //creating the event
    event TweetCreated(uint256 id,address author, string content, uint256 timestamp);
    event TweetLiked(address liker,address tweetAuthoer, uint256 tweetid, uint256 newLikeCount);
    //unliked
     event TweetUnLiked(address unliker,address tweetAuthoer, uint256 tweetid, uint256 newLikeCount);

    ///creating the constructor
    constructor()
    {
        owner  = msg.sender;
    }
    ///modifier
    modifier onlyOwner()
    {
        require(msg.sender ==owner,"YOU ARE NOT THE OWNER"); 
        _;   
    }

    //creating a function to chnge tweet lenght
    function changeTweetLength(uint16 newTweetLength) public onlyOwner{
        MAX_TWEET_Length = newTweetLength;
    }


    
        function createTweet(string memory _tweet) public {
                ///  condintional 
                /// legth <=280
                require(bytes(_tweet).length<=MAX_TWEET_Length,"Tweet is too Long");

            Tweet memory newTweet = Tweet({
                id:tweets[msg.sender].length,
                author : msg.sender,
                content : _tweet,
                timestamp : block.timestamp,
                likes : 0

            });


            tweets[msg.sender].push(newTweet);

            emit TweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);
        }
        //to store tweets in array 
        //.push(_tweeet) added
        //uint i added in get tweet function

        //adding like function
        function likeTweet(address author, uint256 id) external 
        {
            require(tweets[author][id].id ==id,"Tweet Does not exist");
            tweets[author][id].likes++;

            emit TweetLiked(msg.sender, author, id, tweets[author][id].likes);
            
        }

        ///function to unlike
        function unlikeTweet(address author,uint256 id) external 
        {
            require(tweets[author][id].id ==id,"Tweet Does not exist");
            require(tweets[author][id].likes>0,"tweet has no likes");
            tweets[author][id].likes--;

             emit TweetUnLiked(msg.sender, author, id, tweets[author][id].likes);
        }

    //to get the specific tweet
        function getTweet(uint _i) public view returns (Tweet memory){
            return tweets[msg.sender][_i];

        }
        
        //to get all the tweets
        function getalltweets(address _owner) public view returns (Tweet[] memory)
        {
            return tweets[_owner];
        }    



}

