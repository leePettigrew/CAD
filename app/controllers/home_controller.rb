class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    # ...
  end

  def about
    @about_me = "My Name is Lee Pettigrew"
    repo_uri = URI("https://api.github.com/repos/leePettigrew/CAD")
    commits_uri = URI("https://api.github.com/repos/leePettigrew/CAD/commits")

    # Fetch repository data
    repo_response = Net::HTTP.get_response(repo_uri)
    @repo_data = JSON.parse(repo_response.body) if repo_response.is_a?(Net::HTTPSuccess)

    # Fetch commits data
    commits_response = Net::HTTP.get_response(commits_uri)
    if commits_response.is_a?(Net::HTTPSuccess)
      @commits_data = JSON.parse(commits_response.body)
    else
      @commits_data = []
      logger.error "GitHub Commits API response not successful: #{commits_response.message}"
    end
  rescue StandardError => e
    logger.error "Failed to fetch GitHub data: #{e.message}"
  end





end
