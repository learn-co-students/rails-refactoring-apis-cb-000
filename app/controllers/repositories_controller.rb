class RepositoriesController < ApplicationController
  def index # GET data using Repo Endpoint with (w/ access_token)
    github = GithubService.new(session)
    @repos_array = github.get_repos
  end

  def create # POST data using Repo Endpoint (w/ access_token)
    github = GithubService.new(session)
    github.create_repo(params[:name])
    redirect_to '/'
  end
end
