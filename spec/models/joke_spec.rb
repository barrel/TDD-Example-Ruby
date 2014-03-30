require 'spec_helper'

describe Joke do

	it "creates a valid record" do
		count = Joke.all.count
		Joke.create()
		expect(Joke.all.count).to eq (count+1)
	end
	
end