class Joke

	include DataMapper::Resource

  property :id, Serial
  property :setup, String
  property :punchline, String

end