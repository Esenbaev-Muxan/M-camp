class AttachersController < ApplicationController
  before_action :set_project
  before_action :set_attacher, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /attachers or /attachers.json
  def index
    @attachers = @project.attacher

  end

  # GET /attachers/1 or /attachers/1.json
  def show
  end

  # GET /attachers/new
  def new
    @attacher = @project.attacher.new
  end

  # GET /attachers/1/edit
  def edit
  end

  # POST /attachers or /attachers.json
  def create
    @attacher = @project.attacher.build(attacher_params)

    if @attacher.save
      redirect_to project_attachers_path
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /attachers/1 or /attachers/1.json
  def update
    
      if @attacher.update(attacher_params)
        redirect_to(@attacher.project)
      else
        render actions: 'edit'
      end
    
  end

  # DELETE /attachers/1 or /attachers/1.json
  def destroy
    @attacher.destroy 
    redirect_to project_attachers_path
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_attacher
      @attacher = @project.attacher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attacher_params
      params.require(:attacher).permit(:name, :uploader, :project_id)
    end
end
