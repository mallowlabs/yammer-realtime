# YammerRealtime

YammerRealtime is a ruby client for [Yammer Realtime API](https://developer.yammer.com/realtime-deprecated/).

## News
Yammer Realtime API will be deprecated. See detail in [Yammer Blog post](https://developer.yammer.com/realtime-api-deprecation/)

## Requirements

* Ruby 1.9+

## Usage

Using YammerRealtime is quite simple:

```ruby
require 'yammer_realtime'

YammerRealtime.configure do |config|
  config.auth_token = 'abcdefghijklmnopqrstuvwxyz'
end

channel_id = '0123456789'
YammerRealtime::Client.new.start(channel_id) do |message, references|
  puts "#{message['body']}"
end
```

## Authors

* [@mallowlabs](https://github.com/mallowlabs/)

## License

The MIT License (MIT) Copyright (c) 2014 mallowlabs

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
