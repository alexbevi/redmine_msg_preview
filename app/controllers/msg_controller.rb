class MsgController < ApplicationController
  unloadable

  before_filter :load_msg

  include FaceboxRender

  def show
    render_to_facebox
  end
  
  def body
    render :partial => "body", :locals => { :msg => @msg }, :layout => false
  end

###########
# private #
###########

  def load_msg
    @file_id = params[:file_id]
    file = Attachment.find(@file_id)
    @msg = Mapi::Msg.open(file.diskfile)
  end

end

