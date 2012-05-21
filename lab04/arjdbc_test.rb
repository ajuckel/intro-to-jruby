require 'rubygems'
require 'logger'
require 'active_record'
require 'activerecord-jdbc-adapter'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
   :adapter => 'derby',
   :database => 'test.derby'
)

ActiveRecord::Schema.define :version => 0 do
   create_table :pk_tests, :force => true do |t|
     t.string :name
   end
end

class PkTest < ActiveRecord::Base ; end

puts "Creating some AR objects. Note the resource's id."
for x in 1..4
  puts PkTest.create( :name=>"Item #{x}" ).inspect
end
puts "-------------------------------------------------"
puts "Now reading them all back from the database. The resource id is correct."
PkTest.all.each do |i|
  puts i.inspect
end
