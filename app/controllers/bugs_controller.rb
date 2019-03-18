class BugsController < ApplicationController

  # Check if user is logged otherwise he is redireted to the login page
  before_action :authorize
  before_action :set_users_and_states, only: [:new, :create, :edit, :update] # Before new, edit and create action set the @users, @states
  before_action :current_bug, only: [:show, :edit, :update, :destroy] # Before show, edit, update, destroy set the current bug

  def index
    #get all bugs
    @bugs = Bug.all
  end

  def show
  end

  def new
    #New Bug
    @bug = Bug.new
  
  end

  def create
    @bug = Bug.create(bug_params)
   
    #Create a new bug, if error, stay on the created page
    respond_to do |format|
      if @bug.persisted?
        format.html {redirect_to bugs_path, notice: 'Bug was successfully created.'}
      else
        format.html {render :new}
      end
    end
   end

  def edit

  end

  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to bugs_path, notice: 'Bug was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  

  def destroy
   #delete bug
    @bug.destroy
    
    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:owner, :title, :description, :assignate, :state, :severity)
  end

  def set_users_and_states
    @users = User.all
    @states = Bug.states
    @severity = Bug.severities
  end

  def current_bug
    @bug = Bug.find(params[:id])
  end

end
