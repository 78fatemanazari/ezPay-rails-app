class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
    @user = @group.author
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.author = current_user

    # Assuming your form allows for multiple group_ids to be selected
    @entity.groups << Group.find(params[:entity][:group_ids])

    if @entity.save
      flash[:success] = 'Transaction created successfully'
      redirect_to entities_path
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id, group_ids: []).merge(author_id: current_user.id)
  end
end