class AssetController < ApplicationController
  before_action :require_login
  def index
    @assets = Asset.where(user_id: current_user.id)
  end
  
  def new
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
end

