#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
begin
  require 'rb-skypemac'
rescue LoadError
  puts 'rb-skypemac is required.'
end

# 使い方
# ruby wisp.rb '#hoge' 'testあ'
# シングルコーテーションでなければ、$をエスケープしないのでエラーになる。

# インストール
# sudo gem install rb-skypemac

# chat_idが解らないとき
# ruby search_chat_id.rb

chat_id = ARGV[0]
message = ARGV[1]
# chat_id = '#hoge'
# message="test"
# puts chat_id
# puts message

SkypeMac::Skype.send_(:command => "CHATMESSAGE %s %s" % [chat_id, message])


########
# refs #
########

# 気になる - CapistranoでデプロイしたらSkypeチャットに報告 
# http://komagata.tumblr.com/post/114901614/capistrano-skype
# namespace :deploy do
#   namespace :notify do
#     desc 'Send release message to skype chat'
#     task :skype do
#       begin
#         require 'rb-skypemac'
#       rescue LoadError
#         puts 'rb-skypemac is required.'
#       end
#       chat_id = '#komagata1111/$xxxxxxxxxxxxx'
#       message = "cap: #{application}を#{stage}環境にデプロイしました。"
#       SkypeMac::Skype.send_(:command => "CHATMESSAGE #{chat_id} #{message}")
#     end
#     after :deploy, "deploy:notify:skype" if RUBY_PLATFORM =~ /i686-darwin/
#   end
# end



# http://rb-skypemac.rubyforge.org/
# Place a call to the 'echo123' user
# call = Skype.call "echo123" 

# Disconnect a call
# call.hangup

# sleight42 = Skype.online_friends.find { |u| u.handle == "sleight42" }
# call = Skype.call sleight42
# Skype.hangup call # no one wants to talk to him anyway

# Set your user status to away
# Iam.away

# Set your user status to back
# Iam.online

# Attempt to detect and answer a call -- still experimental!  
# Sporadically crashes Skype 2.6.0.17
# loop do
#   begin
#     if not (calls = Skype.incoming_calls).empty?
#       call = Skype.answer calls.first
#       sleep 10
#       Skype.hangup call
#     end
#   rescue RuntimeError => e
#     puts e.message
#   end
#   puts "sleeping..." 
#   sleep 1
# end



# http://www.cocoalife.net/2011/01/post_863.html
# Find Skype Chat ID with rb-skypemac
# 1
# irb > require 'rb-skypemac'
# 2
#  => true
# 3
# irb > SkypeMac::Skype.send_(:command => 'SEARCH RECENTCHATS')
# 4
#  => "CHATS #hogehoge/XXXXXXXXXXXXXXXX, #piyopiyo/XXXXXXXXXXXXXXXX"



# http://d.hatena.ne.jp/tompng/20110605/1307243413
# http://share.skype.com/media/1.2_api_doc_jp.pdf
