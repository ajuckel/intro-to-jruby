#!/usr/bin/env ruby

puts "Hello, World!"
puts "Ruby version: #{RUBY_VERSION}"

unless defined? JRUBY_VERSION
  STDERR.puts "Not running under JRuby yet..."
  exit 1
end

puts "JRuby version: #{JRUBY_VERSION}"

if RUBY_VERSION =~ /^1\.8/
  puts "Running in 1.8 mode.  Try passing --1.9 to run in 1.9 mode."
end

if RUBY_VERSION =~ /^1.9/
  puts "Running in 1.9 mode.  You can still pass --1.8 to run in 1.8 mode."
end

require 'java'
JAVA_VERSION = Java::JavaLang::System.get_property "java.version"
puts "Running on Java version: #{JAVA_VERSION}"
JAVA_VERSION =~ /^1\.(\d+)\./

if $1.to_i >= 7
  puts "You're running on Java 7 or greater.  Welcome to an invokedynamic-capable world!"
end

exit 0
