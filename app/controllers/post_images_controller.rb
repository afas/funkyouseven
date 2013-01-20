class PostImagesController < ApplicationController
  layout false

  def upload
    #raise CanCan::AccessDenied unless can?(:create_upload, object_type.classify.constantize)
    #model = "#{object_type.classify}Image".constantize

    filename = params[:qqfile]
    file = File.open("/tmp/#{filename}", 'wb')
    file.write(request.body.read)
    file.close

    image = PostImage.create(:post_id => params[:post_id], :image => File.open("/tmp/#{filename}", 'r'))

    File.delete("/tmp/#{filename}")

    render :text => "{success:true, id:#{image.id}, new_filename:'#{image.image.url(:preview_item)}', parent_class_name:'post'}"
  rescue Exception => e
    render :text => "{error:#{e.message}}"
  end

  def destroy
    @image = PostImage.find(params[:id])
    @image_id = @image.id
    #raise CanCan::AccessDenied unless can?(:destroy_upload, @stuff_image.object) unless @stuff_image.object.nil?
    @image.delete
  end

  def crop
    @image = PostImage.find(params[:id])
  end

  def update
    image = PostImage.find(params[:id])

    unless image.nil?
      image.cover = params[:cover]
      image.preview = params[:preview]
      if params[:title] == 'empty'
        image.title = ''
      else
        image.title = params[:title]
      end
      image.save
    end

    render :text => "Ok"
  end

end
