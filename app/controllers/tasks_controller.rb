class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @group = Group.where("id=?",params[:group_id]).first
    @tasks = Task.where("group_id=?",params[:group_id])
    @all_user_groups = Group.where("user_id=?",current_user[:id])
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @group = Group.where("id=?",params[:group_id])
    @status_array = Status.all.map{|status| [status.name, status.id] }
    @title = 'Добавить новую задачу в группу '+ @group.first[:name]
    @btn_lbl = 'Создать'
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @group = Group.where("id=?",params[:group_id])
    @title = 'Редактировать задачу в группе '+ @group.first[:name]
    @btn_lbl = 'Редактировать'
    @status_array = Status.all.map{|status| [status.name, status.id] }
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @group_task_params = task_params
    @group_task_params[:group_id] = params[:group_id]
    @task = Task.new(@group_task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to group_tasks_path(params[:group_id]), notice: 'Задача успешно создана.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to group_tasks_path(params[:group_id]), notice: 'Задача успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to group_tasks_path(params[:group_id]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :note, :status_id, :group_id, :duration, :deadline, :commit)
    end


end
