class RepositoriesController < ApplicationController
  def index
    # github = GithubService.new({'access_token': session[:token]})
    # @repos_array = github.get_repos
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    @repos_array = JSON.parse(response.body)
  end

  def create
    GithubService.new({access_token: session[:token]}).create_repo(params[:name])
    redirect_to '/'
  end
end
