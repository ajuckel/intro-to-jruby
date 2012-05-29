* Lab 06: Deploy a Rails app on Java Web Container

Enclosed is the graphy app updated to run on JRuby.

Deploy it to your Java Web Container of choice.

 $ gem install warbler # defaults to running app in 1.8 mode
 $ warble config # generates config/warble.rb
 $ vim config/warble.rb # set config.webxml.jruby.compat.version
 $ warble war
 $ cp graphy.war {Java Web Container}/webapps

