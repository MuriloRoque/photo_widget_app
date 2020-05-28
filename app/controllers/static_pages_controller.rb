class StaticPagesController < ApplicationController
  require 'flickraw'

  def home
    unless search_params.nil?
      @photos = flickr.photos.search(user_id: search_params[:id])
    end
  end

  private

  def search_params
    params.require(:search).permit(:id) if params[:search].present?
  end
end
