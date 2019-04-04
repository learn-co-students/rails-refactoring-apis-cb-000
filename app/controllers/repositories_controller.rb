class RepositoriesController < ApplicationController
  def index
    hash = {}
    hash["name"] = "index"
    hash["html_url"] = "stub"
    repo = GithubRepo.new(hash)
    @repos_array = repo.index()
  end

  def create
    hash = {}
    hash["name"] = "index"
    hash["html_url"] = "stub"
    repo = GithubRepo.new(hash)
    @response = repo.create(params)
    redirect_to '/'
  end
end
