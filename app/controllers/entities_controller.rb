class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
    @user = @group.author
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author = current_user

    @user = User.find(params[:user_id])
  @group = Group.find(params[:group_id])

    if @entity.save
      # If save is successful, associate groups with the entity
      @entity.groups << Group.find(params[:entity][:group_ids]) if params[:entity][:group_ids].present?

      flash[:success] = 'Entity created successfully'
      redirect_to entities_path
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
