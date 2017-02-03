module ApplicationHelper
  def background_pic(cocktail,width,height)
    if cocktail.photo?
      cl_image_path cocktail.photo.path, width: width, height: height, crop: :fill
    else
      cocktail.picture
    end
  end
end
