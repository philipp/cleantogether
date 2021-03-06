class HomeController < ApplicationController

  def index
    @stories = Story.paginate   :page       => params[:page], 
    :per_page   => 5, 
    :conditions => ["geo_location_id != ? and weight > 0", :null],
    :order      => "created_at DESC"
  end

  def picture
    @picture = Picture.find(params[:id])
    @thumbnail = Picture.find_by_parent_id_and_thumbnail(@picture.id,params[:thumb])
    send_data(@thumbnail.db_file.data,
    :filename => @thumbnail.filename,
    :type => @thumbnail.content_type,
    :disposition => "inline")
  end

  def insufficient
  end

  def terms
  end
  
  def enlarge_picture
    @picture = Picture.find(params[:id])
    @thumbnail = Picture.find_by_parent_id_and_thumbnail(@picture.id, :normal)
  end

  def shrink_picture
    @picture = Picture.find(params[:id])
    @thumbnail = Picture.find_by_parent_id_and_thumbnail(@picture.id, :thumb)
  end

end
