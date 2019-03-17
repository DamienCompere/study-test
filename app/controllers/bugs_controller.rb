class BugsController < ApplicationController

  # Check if user is logged otherwise he is redireted to the login page
  before_action :authorize
  before_action :set_users_and_states, only: [:new, :create] # Before new and create action set the @users, @states

  def index
    
    @bugs = Bug.all
    puts @bugs

  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
    @users = User.all
    @states = Bug.states
  end

  def create
    @bug = Bug.create(bug_params)
   
    respond_to do |format|
      if @bug.persisted?
        format.html {redirect_to bugs_path, notice: 'Bug was successfully created.'}
      else
        format.html {render :new}
      end
    end
   end

  def edit
    @bug = Bug.find(params[:id])
    @users = User.all
    @states = Bug.states
  end

  def update
    @bug = Bug.find(params[:id])
    @bug.update(bug_params)

    redirect_to bug_path(@bug)
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    
    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:owner, :title, :description, :assignate, :state)
  end

  def set_users_and_states
    @users = User.all
    @states = Bug.states
  end

end
