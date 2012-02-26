# -*- coding: utf-8 -*-
chat_id="#hoge"
before :deploy, :roles => :db, :except => { :no_release => true } do
  result = system("rubyskype/wisp.rb '%s' '[%s:%s:%s] Deploy start.'" % [chat_id, application, stage, branch])
end
after :deploy, :roles => :db, :except => { :no_release => true } do
  result = system("rubyskype/wisp.rb '%s' '[%s:%s:%s] Deploy end.'" % [chat_id, application, stage, branch])
end
