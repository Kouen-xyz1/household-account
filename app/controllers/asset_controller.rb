class AssetController < ApplicationController
  before_action :require_login
  def index
    @assets = Asset.where(user_id: current_user.id)
  end
  
  def new
  end
  
  def edit
    @asset = Asset.find_by(id: params[:id])
    redirect_to :asset_index_path and return unless @asset
  end

  def update
    @asset = Asset.find_by(id: params[:id])
    redirect_to :asset_index_path and return unless @asset
    @asset.update(asset_params)
    redirect_to action: :index and return
  end

  def create
    Asset.create(
      user_id: current_user.id,
      asset_type: params[:asset_type],
      name: params[:name]
      )
    redirect_to action: :index and return
  end
  
  def destroy
    @asset = Asset.find_by(id: params[:id])
    redirect_to :asset_index_path and return unless @asset
    @asset.destroy
    redirect_to action: :index and return
  end
  
  def asset_params
    params.require(:asset).permit(:user_id, :asset_type, :name)
  end

end

