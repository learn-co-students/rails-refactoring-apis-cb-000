class GithubRepo
  attr_reader :name, :url

  def initialize(options)
    @name = options['name']
    @url = options['html_url']
  end
end
