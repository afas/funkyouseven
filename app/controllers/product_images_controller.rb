class ProductImagesController < ApplicationController
  layout false

  def upload
    #raise CanCan::AccessDenied unless can?(:create_upload, object_type.classify.constantize)
    #model = "#{object_type.classify}Image".constantize

    filename = "#{Utils.generate_name}#{File.extname(params[:qqfile])}"
    file = File.open("/tmp/#{filename}", 'wb')
    file.write(request.body.read)
    file.close

    image = ProductImage.create(:product_id => params[:product_id], :image => File.open("/tmp/#{filename}", 'r'))

    File.delete("/tmp/#{filename}")

    render :text => "{success:true, id:#{image.id}, new_filename:'#{image.image.url(:preview_item)}', parent_class_name:'product'}"
  rescue Exception => e
    render :text => "{error:#{e.message}}"
  end

  def destroy
    @image = ProductImage.find(params[:id])
    @image_id = @image.id
    #raise CanCan::AccessDenied unless can?(:destroy_upload, @stuff_image.object) unless @stuff_image.object.nil?
    @image.delete
  end

  def crop
    @image = ProductImage.find(params[:id])
    unless params[:product_image].nil?
      @image.crop_x = params[:product_image][:crop_x] unless params[:product_image][:crop_x].nil?
      @image.crop_y = params[:product_image][:crop_y] unless params[:product_image][:crop_y].nil?
      @image.crop_w = params[:product_image][:crop_w] unless params[:product_image][:crop_w].nil?
      @image.crop_h = params[:product_image][:crop_h] unless params[:product_image][:crop_h].nil?
      Utils.reprocess_image(@image)

      render :action => :crop_finish
    end
  end

  def update
    image = ProductImage.find(params[:id])

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
