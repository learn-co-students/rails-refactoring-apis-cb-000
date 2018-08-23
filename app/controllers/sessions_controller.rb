class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create # Request JSON response and save access_token (using credentials and params[:code])
    github = GithubService.new
    github.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:access_token] =  github.access_token
    session[:username] = github.get_username

    redirect_to '/'
  end

end
