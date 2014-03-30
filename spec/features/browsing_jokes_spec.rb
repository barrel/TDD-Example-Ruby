require 'spec_helper'

describe "Browsing Jokes", type: :feature do

	describe "Root URL" do
		it "redirects to /jokes" do
			visit "/"
			expect(current_path).to eq "/jokes"
		end
	end

	describe "Jokes Index Page" do
		it "list all of the jokes" do
			3.times do |i| 
				Joke.create(setup: "My Setup #{i}", punchline: "My Punchline #{i}")
			end
			visit "/jokes"
			3.times do |i|
				expect(page).to have_content "My Setup #{i}"
				expect(page).to have_content "My Punchline #{i}"
			end
		end
	end # Jokes Index Page

	describe "Adding a New Joke" do
		it "Add a new joke" do
			count = Joke.all.count
			visit "/jokes/new"
			within("#new_joke") do
				fill_in "joke[setup]", with: "My Joke Setup"
				fill_in "joke[punchline]", with: "My Joke Punchline"
				click_button "Add Joke"
			end
			expect(Joke.all.count).to eq (count+1)
		end
	end # Adding a New Joke
	
end