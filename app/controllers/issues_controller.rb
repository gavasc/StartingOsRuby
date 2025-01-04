require "octokit"

class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create(repo)
    client = Octokit::Client.new access_token: ENV["GH-ACCESS-TOKEN"]
    repo_issues = client.list_issues repo.link, labels: "good-first-issue"
    repo_issues.each do |issue|
      Issue.create({
        repository: repo,
        title: issue[:title],
        link: issue[:html_url],
        open: !issue[:closed_at].nil?,
        description: issue[:body]
      })
    end
  end
end
