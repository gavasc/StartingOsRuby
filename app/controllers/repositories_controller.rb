class RepositoriesController < ApplicationController
  def new
    @repository = Repository.new
  end

  def create
    hash_params = repository_params
    @repository = Repository.new(hash_params)
    # get the repository name by spliting the link: <user>/<repo_name>
    @repository.name = hash_params[:link].split("/")[1]

    if !@repository.save
      redirect_to issues_path, alert: "Repositório inválido!"
    else
      IssuesController.new.create @repository
    end

    redirect_to issues_path, notice: "Repositório adicionado!"
  end

  private

  def repository_params
    params.expect(repository: [ :link ])
  end
end
