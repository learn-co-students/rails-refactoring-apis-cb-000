class RepositoriesController < ApplicationController
  def index
    #response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    github = GithubService.new(session[:service])
    @repos_array = github.get_repos  #JSON.parse(response.body)
  end

  def create
    github = GithubService.new(session[:service])
    github.create_repo(params[:name])
    #response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
