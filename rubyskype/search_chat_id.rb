#! /usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'rubygems'
require 'rb-skypemac'

# 使い方
# ruby search_chat_id.rb

def search_chat_name()
  chats = SkypeMac::Skype.send_(:command => 'SEARCH RECENTCHATS')
  chats=chats.sub("CHATS ","").split(/,/)
  for chat_id in chats
    puts SkypeMac::Skype.send_(:command => 'GET CHAT %s FRIENDLYNAME' % chat_id)
  end
end

# チャットIDを取得する
search_chat_name()
