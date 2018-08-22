class RepositoriesController < ApplicationController
  def index
    byebug
    github = GithubService.new(session[:token])
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new(session[:token])
    github.create_repo(params[:name])
    redirect_to '/'
  end
end
