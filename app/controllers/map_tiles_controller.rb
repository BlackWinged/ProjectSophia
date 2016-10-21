class MapTilesController < ApplicationController
  def get_tile
    map_params
    lat = params[:lat]
    long = params[:long]
    zoom = params[:zoom]
    sizeOfBounds = params[:bbox]
    #urlString = urlString + calculate_tile_name(lat.to_f, long.to_f, zoom.to_i)
    imageArray = []
    getTilesInBbox_OSM(lat, long, imageArray, zoom, sizeOfBounds)
    respond_to do |format|
      format.html {render xml: @image, content_type: 'image/png', status: :ok}
      format.json {render json: imageArray}
    end
  end

  def getTilesInBbox_OSM(lat, long, imageArray, zoom, sizeOfBounds)
    coordinates = get_tile_number(lat.to_f,long.to_f, zoom.to_i)
    for i in coordinates[:x].to_i-(sizeOfBounds).to_i..coordinates[:x].to_i+(sizeOfBounds).to_i
      for j in coordinates[:y].to_i-(sizeOfBounds).to_i..coordinates[:y].to_i+(sizeOfBounds).to_i
        imageObject = {}
        imageObject[:filepath] = checkIfOnDisk(zoom, i, j).sub("public/", "")
        imageObject[:cood] = get_lat_lng_for_number(i, j, zoom.to_i)
        imageArray.push(imageObject)
      end
    end
  end
  
  def fireRequestForTile(zoom, x, y)
        urlString = "https://b.tile.openstreetmap.org"
        urlString = urlString + "/" + zoom + "/" + x.to_s + "/" + y.to_s + ".png"
        body = RestClient.get(urlString).body()
        return saveToDisk(body, zoom, x, y)
  end

  #Needs checking if file is too old
  #Also, action job to check if file size is getting out of hand
  def checkIfOnDisk(zoom, x, y)
    directory = "public/tiles/"
    directory = directory + zoom.to_s
    directory = directory + "/" + x.to_s + "-" + y.to_s + ".png"
    if File.exists?(directory)
      return directory
    else
      fireRequestForTile(zoom, x, y)
    end
  end

  def saveToDisk(data, zoom, x, y)
    directory = "public/tiles/"
    unless File.exists?(directory)
      Dir.mkdir(directory)
    end
    directory = directory + zoom.to_s
    unless File.exists?(directory)
      Dir.mkdir(directory)
    end
    directory = directory + "/" + x.to_s + "-" + y.to_s + ".png"

    File.open(directory, "wb") { |f| f.write(data) }
    return directory
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
