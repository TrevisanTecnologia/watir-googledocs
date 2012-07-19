require 'rubygems'
require 'watir-webdriver'
require 'rspec'

describe "Look for browser elements" do

	before(:each) do
	  @firefox = Watir::Browser.new :firefox
		@firefox.goto 'https://docs.google.com/spreadsheet/viewform?formkey=dHFQdmltaDdaYkFjVVVwd1dQXzJQSEE6MQ#gid=0'
	end

	after(:each) do
	  @firefox.close
	end

	it "Check if the first field exists" do
		first_field = @firefox.text_field :id => 'entry_0'
		first_field.exists?.should be(true)
	end
	
	it "Fill the first field" do
	  first_field = @firefox.text_field :id => 'entry_0'
	  first_field.when_present.set 'Luiza foi para o Canada, denovo.'
	  first_field.value.should == 'Luiza foi para o Canada, denovo.'
	end
	
	it "Check age between 29 and 50" do
    age_radio = @firefox.label(:text => 'Idade em anos').parent.radio :value => 'entre 29 anos  e 50 anos'
    age_radio.set
    age_radio.set?.should be(true)
  end

end