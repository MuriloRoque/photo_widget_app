class StaticPagesController < ApplicationController
  require 'flickraw'

  def home
    @photos = flickr.photos.search(user_id: search_params[:id]) unless search_params.nil?
  end

  private

  def search_params
    params.require(:search).permit(:id) if params[:search].present?
  end
end
