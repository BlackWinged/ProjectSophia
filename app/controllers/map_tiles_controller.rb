class MapTilesController < ApplicationController
  before_action :get_tile
  
  
  def get_tile
    @image = RestClient.get("https://b.tile.openstreetmap.org/10/909/403.png").body()
    render xml: @image, content_type: 'image/png'
  end
    
end
