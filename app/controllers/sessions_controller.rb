class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create # RETRIEVE JSON body access_token & save in session
    github = GithubService.new
    github.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:access_token] =  github.access_token
    session[:username] = github.get_username

    redirect_to '/'
  end

end
