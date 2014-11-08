require 'spec_helper'

describe YammerRealtime do
  before do
    stub_request(:get, "https://www.yammer.com/api/v1/realtime.json").
      to_return(status: 200, body: <<JSON)
{
"realtimeURI": "https://1-839.rt.staging.yammer.com/cometd/",
"authentication_token":"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
}
JSON
    stub_request(:post, "https://1-839.rt.staging.yammer.com/cometd/handshake").
      to_return(status: 200, body: <<JSON)
[
  {
    "id": "1",
    "minimumVersion":"0.9",
    "supportedConnectionTypes":["long-polling"],
    "successful":true,
    "channel":"/meta/handshake",
    "advice":{"reconnect":"retry","interval":0,"timeout":30000},
    "clientId":"ogmvzagu6rujqzqf",
    "version":"1.0"
  }
]
JSON
    stub_request(:post, "https://1-839.rt.staging.yammer.com/cometd/").
      to_return(status: 200, body: <<JSON)
[
  {
    "id":"2",
    "successful":true,
    "subscription":"/feeds/qgnP/primary",
    "channel":"/meta/subscribe"
  },
  {
    "id":"3","subscription":"/feeds/qgnP/secondary",
    "successful":true,
    "channel":"/meta/subscribe"
  }
]
JSON
    stub_request(:post, "https://1-839.rt.staging.yammer.com/cometd/connect").
      to_return(status: 200, body: <<JSON)
[
  {
    "id":"2625699",
    "data":{
      "type":"message",
      "data":{
        "messages": [
          {
            "message_type": "update",
            "client_type": "Web",
            "liked_by": {
              "count": 0,
              "names": []
            },
            "created_at": "2011/02/12 02:41:14 +0000",
            "privacy": "public",
            "body": {
              "parsed": "Here's a message with a Topic Application.",
              "plain": "Here's a message with a Topic Application."
            },
            "network_id": 104604,
            "thread_id": 78654647,
            "sender_type": "user",
            "id": 78654647,
            "client_url": "https://www.yammer.com/",
            "url": "https://www.yammer.com/api/v1/messages/78654647",
            "sender_id": 1452329,
            "replied_to_id": null,
            "system_message": false,
            "attachments": [],
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/messages/78654647",
            "direct_message": false
          },
          {
            "message_type": "update",
            "client_type": "Web",
            "created_at": "2011/02/12 02:40:44 +0000",
            "liked_by": {
              "count": 0,
              "names": []
            },
            "privacy": "public",
            "body": {
              "parsed": "Unicorns are Awesome, here's a photo of a Unicorn.",
              "plain": "Unicorns are Awesome, here's a photo of a Unicorn."
            },
            "network_id": 104604,
            "thread_id": 78654634,
            "id": 78654634,
            "sender_type": "user",
            "client_url": "https://www.yammer.com/",
            "url": "https://www.yammer.com/api/v1/messages/78654634",
            "sender_id": 1452329,
            "replied_to_id": null,
            "system_message": false,
            "attachments": [
              {
                "type": "image",
                "content_type": "image/png",
                "image": {
                  "thumbnail_url": "https://www.yammer.com/api/v1/images/849667/medium.png",
                  "url": "https://www.yammer.com/api/v1/images/849667.png",
                  "size": 41646
                },
                "name": "angry_unicorn.png",
                "id": 849667,
                "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/images/849667"
              }
            ],
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/messages/78654634",
            "direct_message": false
          },
          {
            "message_type": "update",
            "client_type": "Web",
            "liked_by": {
              "count": 0,
              "names": []
            },
            "created_at": "2011/02/12 02:40:10 +0000",
            "privacy": "public",
            "body": {
              "parsed": "Yes, that was very interesting.",
              "plain": "Yes, that was very interesting."
            },
            "network_id": 104604,
            "sender_type": "user",
            "id": 78654623,
            "thread_id": 78648632,
            "client_url": "https://www.yammer.com/",
            "url": "https://www.yammer.com/api/v1/messages/78654623",
            "sender_id": 1452329,
            "replied_to_id": 78648632,
            "system_message": false,
            "attachments": [],
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/messages/78654623",
            "direct_message": false
          },
          {
            "message_type": "update",
            "client_type": "Web",
            "liked_by": {
              "count": 0,
              "names": []
            },
            "created_at": "2011/02/12 00:43:55 +0000",
            "privacy": "public",
            "body": {
              "parsed": "Something interesting.",
              "plain": "Something interesting."
            },
            "network_id": 104604,
            "sender_type": "user",
            "id": 78648632,
            "thread_id": 78648632,
            "client_url": "https://www.yammer.com/",
            "url": "https://www.yammer.com/api/v1/messages/78648632",
            "sender_id": 4022984,
            "replied_to_id": null,
            "system_message": false,
            "attachments": [],
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/messages/78648632",
            "direct_message": false
          },
          {
            "message_type": "system",
            "client_type": "Web",
            "liked_by": {
              "count": 0,
              "names": []
            },
            "created_at": "2010/05/04 22:40:15 +0000",
            "privacy": "public",
            "body": {
              "parsed": "has created the Yammer Developers Test Community community.",
              "plain": "has created the Yammer Developers Test Community community."
            },
            "network_id": 104604,
            "thread_id": 43460838,
            "sender_type": "user",
            "id": 43460838,
            "client_url": "https://www.yammer.com/",
            "url": "https://www.yammer.com/api/v1/messages/43460838",
            "sender_id": 1452329,
            "replied_to_id": null,
            "system_message": true,
            "attachments": [],
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/messages/43460838",
            "direct_message": false
          }
        ],
        "meta": {
          "realtime": {
            "uri": "https://31.rt.yammer.com/cometd/",
            "authentication_token": "IDTNCyj4IGXIOJq7P1DXtrB20QknhgaZOE1s6+pBMrB4nKtWKi1OLVKyMjEwMrK0MNFRykstKc8vylayMjQwMTMACqRWFGQWVQL5xgYGJgZmBmZmtQCdig7L",
            "channel_id": "SNFqp"
          },
          "current_user_id": 4022984,
          "show_billing_banner": false,
          "requested_poll_interval": 60,
          "ymodules": [],
          "feed_name": "Company Feed",
          "feed_desc": "Yammer Developers Test Community's public messages"
        },
        "references": [
          {
            "type": "topic",
            "url": "https://www.yammer.com/api/v1/topics/712836",
            "permalink": "interesting",
            "normalized_name": "interesting",
            "name": "Interesting",
            "id": 712836,
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/topics/712836"
          },
          {
            "type": "user",
            "job_title": "Test Title",
            "full_name": "Mikeal Rogers",
            "url": "https://www.yammer.com/api/v1/users/4022984",
            "name": "mikealrogers-guest",
            "mugshot_url": "https://assets3.yammer.com/images/no_photo_small.gif",
            "id": 4022984,
            "stats": {
              "followers": 1,
              "updates": 1,
              "following": 0
            },
            "state": "active",
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/users/mikealrogers-guest"
          },
          {
            "type": "user",
            "job_title": null,
            "full_name": "Matt Knopp",
            "url": "https://www.yammer.com/api/v1/users/1452329",
            "name": "mknopp",
            "mugshot_url": "https://assets1.yammer.com/user_uploaded/photos/p1/0141/2640/n1644278019_46479_62_small.jpg",
            "id": 1452329,
            "stats": {
              "followers": 0,
              "updates": 4,
              "following": 2
            },
            "state": "active",
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/users/mknopp"
          },
          {
            "type": "thread",
            "topics": [
              {
                "type": "topic",
                "id": 712836
              }
            ],
            "privacy": "public",
            "thread_starter_id": 78654647,
            "url": "https://www.yammer.com/api/v1/messages/in_thread/78654647",
            "has_attachments": false,
            "id": 78654647,
            "stats": {
              "latest_reply_id": 78654647,
              "updates": 1,
              "latest_reply_at": "2011/02/12 02:41:14 +0000",
              "first_reply_id": null,
              "first_reply_at": null
            },
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity#/Threads/show?threadId=78654647",
            "direct_message": false
          },
          {
            "type": "thread",
            "topics": [],
            "privacy": "public",
            "thread_starter_id": 78648632,
            "url": "https://www.yammer.com/api/v1/messages/in_thread/78648632",
            "has_attachments": false,
            "id": 78648632,
            "stats": {
              "latest_reply_id": 78654623,
              "updates": 2,
              "latest_reply_at": "2011/02/12 02:40:10 +0000",
              "first_reply_id": 78654623,
              "first_reply_at": "2011/02/12 02:40:10 +0000"
            },
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity#/Threads/show?threadId=78648632",
            "direct_message": false
          },
          {
            "type": "thread",
            "topics": [],
            "privacy": "public",
            "thread_starter_id": 43460838,
            "url": "https://www.yammer.com/api/v1/messages/in_thread/43460838",
            "has_attachments": false,
            "id": 43460838,
            "stats": {
              "latest_reply_id": 43460838,
              "updates": 1,
              "latest_reply_at": "2010/05/04 22:40:15 +0000",
              "first_reply_id": null,
              "first_reply_at": null
            },
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity#/Threads/show?threadId=43460838",
            "direct_message": false
          },
          {
            "type": "thread",
            "topics": [],
            "privacy": "public",
            "thread_starter_id": 78654634,
            "url": "https://www.yammer.com/api/v1/messages/in_thread/78654634",
            "has_attachments": false,
            "id": 78654634,
            "stats": {
              "latest_reply_id": 78654634,
              "updates": 1,
              "latest_reply_at": "2011/02/12 02:40:44 +0000",
              "first_reply_id": null,
              "first_reply_at": null
            },
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity#/Threads/show?threadId=78654634",
            "direct_message": false
          },
          {
            "message_type": "update",
            "type": "message",
            "created_at": "2011/02/12 00:43:55 +0000",
            "body": {
              "plain": "Something interesting."
            },
            "network_id": 104604,
            "sender_type": "user",
            "id": 78648632,
            "thread_id": 78648632,
            "url": "https://www.yammer.com/api/v1/messages/78648632",
            "sender_id": 4022984,
            "replied_to_id": null,
            "system_message": false,
            "web_url": "https://www.yammer.com/yammerdeveloperstestcommunity/messages/78648632"
          }
        ],
        "threaded_extended": {}
      }
    },
    "channel":"/feeds/qgnP/secondary"
  },
  {
    "id":"14",
    "successful":true,
    "channel":"/meta/connect"
  }
]
JSON
  end
  context 'configure' do
    before do
      YammerRealtime.configure { |config| config.auth_token = 'abcdefghijklmnopqrstuvwxyz' }
      @message = nil
      YammerRealtime::Client.new(false).start('0123456789') do |message, references|
        @message = message
      end
    end
    it 'returns the same result' do
      expect(@message["body"]["plain"]).to eq('has created the Yammer Developers Test Community community.')
    end
  end
end

