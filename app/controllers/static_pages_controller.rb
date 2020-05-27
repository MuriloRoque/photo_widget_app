class StaticPagesController < ApplicationController
  require 'flickraw'
  FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
  FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']

  def home
    list   = flickr.photos.getRecent
    id     = list[0].id
    secret = list[0].secret
    @info = flickr.photos.getInfo photo_id: id, secret: secret
    sizes = flickr.photos.getSizes photo_id: id
    @original = sizes.find { |s| s.label == 'Original' }
    @photos = flickr.photos.search(user_id: '188655404@N06')
  end
end
