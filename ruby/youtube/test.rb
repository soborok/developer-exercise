require_relative 'youtube_client'
require 'test/unit'

class YoutubeClientTest < Test::Unit::TestCase

  def setup
    @client = YoutubeClient.new

    @search_term = "dogs"
    @response_body = '{
     "kind": "youtube#searchListResponse",
     "etag": "\"krboRo_tpL036O3XTWYvMqtyDRY/RlrS_feQKCpHmAXYw9bx1z5nyrg\"",
     "nextPageToken": "CAMQAA",
     "pageInfo": {
      "totalResults": 1000000,
      "resultsPerPage": 3
     },
     "items": [
      {
       "kind": "youtube#searchResult",
       "etag": "\"krboRo_tpL036O3XTWYvMqtyDRY/M-VYdHEsqyE1SqT3g91C7VdEHj0\"",
       "id": {
        "kind": "youtube#video",
        "videoId": "Vi8VKaOi2nc"
       },
       "snippet": {
        "publishedAt": "2014-05-09T16:12:09.000Z",
        "channelId": "UClsy9JcwIVaq29WhPFI0eBg",
        "title": "BEST FUNNY DOGS COMPILATION LONG (2013 - 2014)",
        "description": "BEST FUNNY DOGS COMPILATION (2013 - 2014) Funny Animals includes cats, dogs, elephants, goats, otters, seals, birds, monkeys, Funny Cats, Funny, Dogs, ...",
        "thumbnails": {
         "default": {
          "url": "https://i.ytimg.com/vi/Vi8VKaOi2nc/default.jpg"
         },
         "medium": {
          "url": "https://i.ytimg.com/vi/Vi8VKaOi2nc/mqdefault.jpg"
         },
         "high": {
          "url": "https://i.ytimg.com/vi/Vi8VKaOi2nc/hqdefault.jpg"
         }
        },
        "channelTitle": "onehourcompilations",
        "liveBroadcastContent": "none"
       }
      },
      {
       "kind": "youtube#searchResult",
       "etag": "\"krboRo_tpL036O3XTWYvMqtyDRY/OpKbF35oEWuH-iYH1MQdFqxCcCc\"",
       "id": {
        "kind": "youtube#video",
        "videoId": "XIXLoGsj-kM"
       },
       "snippet": {
        "publishedAt": "2015-05-08T10:00:00.000Z",
        "channelId": "UCzpCc5n9hqiVC7HhPwcIKEg",
        "title": "Corn Dogs With Stampycat",
        "description": "Main Episode: http://youtu.be/svQOVq1h_8M Check out Stampy\'s new show, Wonderquest: www.youtube.com/Wonderquest Get the GMM Coffee Mug!",
        "thumbnails": {
         "default": {
          "url": "https://i.ytimg.com/vi/XIXLoGsj-kM/default.jpg"
         },
         "medium": {
          "url": "https://i.ytimg.com/vi/XIXLoGsj-kM/mqdefault.jpg"
         },
         "high": {
          "url": "https://i.ytimg.com/vi/XIXLoGsj-kM/hqdefault.jpg"
         }
        },
        "channelTitle": "rhettandlink3",
        "liveBroadcastContent": "none"
       }
      },
      {
       "kind": "youtube#searchResult",
       "etag": "\"krboRo_tpL036O3XTWYvMqtyDRY/-6Sf_xooTUkE8JZobHBtBAvq5JY\"",
       "id": {
        "kind": "youtube#video",
        "videoId": "SOrA5SRTy6o"
       },
       "snippet": {
        "publishedAt": "2015-05-08T07:30:00.000Z",
        "channelId": "UCfPhyExfcaqJBKc3HO3cNBw",
        "title": "Stray Dogs Show Up At The Funeral Of The Nice Lady Who Used to Feed Them",
        "description": "Check Out JustKiddingNews Podcasts! http://www.Soundcloud.com/justkiddingnews 1 - Dog Salute News ...",
        "thumbnails": {
         "default": {
          "url": "https://i.ytimg.com/vi/SOrA5SRTy6o/default.jpg"
         },
         "medium": {
          "url": "https://i.ytimg.com/vi/SOrA5SRTy6o/mqdefault.jpg"
         },
         "high": {
          "url": "https://i.ytimg.com/vi/SOrA5SRTy6o/hqdefault.jpg"
         }
        },
        "channelTitle": "JustKiddingNews",
        "liveBroadcastContent": "none"
       }
      }
     ]
    }'
  end
  
  def test_number_of_search_results
    assert_equal @client.number_of_search_results, 3
  end

  def test_create_search_request
    assert @client.create_search_request(@search_term).include?("q=dogs") 
  end

  def test_parse_search_results
    @client.parse_search_results(@response_body)
    assert @client.links_to_search_results
  end
  
end
