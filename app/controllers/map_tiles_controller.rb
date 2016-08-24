class MapTilesController < ApplicationController
  def get_tile
    #11/38.0008/138.3677
    map_params
    lat = params[:lat]
    long = params[:long]
    zoom = params[:zoom]
    urlString = "https://b.tile.openstreetmap.org"
    urlString = urlString + calculate_tile_name(lat.to_f, long.to_f, zoom.to_i)
    @image = RestClient.get(urlString).body()
    render xml: @image, content_type: 'image/png'
  end

  def calculate_tile_name (lat_deg, lng_deg, zoom)
    coordinates = get_tile_number(lat_deg, lng_deg, zoom)
    return "/"+zoom.to_s+"/" + coordinates[:x].to_s + "/" + coordinates[:y].to_s + ".png"
  end

  def get_tile_number(lat_deg, lng_deg, zoom)
    lat_rad = lat_deg/180 * Math::PI
    n = 2.0 ** zoom
    x = ((lng_deg + 180.0) / 360.0 * n).to_i
    y = ((1.0 - Math::log(Math::tan(lat_rad) + (1 / Math::cos(lat_rad))) / Math::PI) / 2.0 * n).to_i

    {:x => x, :y =>y}
  end

  def get_lat_lng_for_number(xtile, ytile, zoom)
    n = 2.0 ** zoom
    lon_deg = xtile / n * 360.0 - 180.0
    lat_rad = Math::atan(Math::sinh(Math::PI * (1 - 2 * ytile / n)))
    lat_deg = 180.0 * (lat_rad / Math::PI)
    {:lat_deg => lat_deg, :lng_deg => lon_deg}
  end

  def map_params
    params.require([:long, :lat])
  end
end
