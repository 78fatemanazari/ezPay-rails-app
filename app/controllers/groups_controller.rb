class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @group = Group.new
    @user = current_user
  end

  def create
    @group = Group.create(group_params)
    @group.author = current_user
    if @group.save
      flash[:success] = 'Category created!'
      redirect_to user_groups_path(@group.author)
    else
      flash[:error] = 'Something went wrong!'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
