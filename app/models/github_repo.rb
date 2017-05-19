class GithubRepo

  attr_reader :name, :url

  @@all = []

  def initialize(hash)
    @name = hash["name"]
    @url = hash["html_url"]
    @@all << self
  end

  def self.all
  	@@all
  end

end