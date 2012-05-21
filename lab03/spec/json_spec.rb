require 'json'
describe "json parser" do
  before do
    @valid_data = <<-JSON
[{ "first_name": "John"},
 { "last_name": "Doe"} ]
    JSON
    @invalid_data = <<-JSON
[{ "first_name" => "John"},
 { "last_name" => "Doe"} ]
    JSON
  end
  it "should parse valid data without error" do
    iterations = (ENV["ITERATIONS"] || 10000).to_i
    1.upto(iterations) do
      JSON.parse(@valid_data)
    end
  end
  it "should throw error with invalid data" do
    expect { JSON.parse(@invalid_data) }.to raise_error(JSON::ParserError)
  end
end
