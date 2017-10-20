class GithubService

  attr_reader :access_token

  def initialize(access_hash = nil)

    @access_token = access_hash["access_token"] if access_hash
  end

  def authenticate!(client_id, client_secret, code)
    response = Faraday.post "https://github.com/login/oauth/access_token",
        {client_id: client_id, client_secret: client_secret, code: code},
        {'Accept' => 'application/json'}

    @access_token =  JSON.parse(response.body)



  end

  def get_username
    user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{@access_token}", 'Accept' => 'application/json'}
    user_json = JSON.parse(user_response.body)
    user_json["login"]

  end

  def get_repos
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{@access_token}", 'Accept' => 'application/json'}
    repos_array = JSON.parse(response.body)

    repos_array.map{|repo|  GithubRepo.new(repo) }
  end

  def create_repo(name)
    r = {:name => "#{name}"}.to_json
    Faraday.post "https://api.github.com/user/repos" do |req|
    req.params['body'] = {name: name}.to_json
    req.params['Authorization'] = "token #{@access_token}"
    req.headers['Accept'] = 'application/json'
    req.body = r
  end
  end

end
