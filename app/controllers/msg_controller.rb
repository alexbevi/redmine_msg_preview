class MsgController < ApplicationController
  unloadable

  include FaceboxRender

  def show
    file = Attachment.find(params[:file_id])
    @msg = Mapi::Msg.open(file.diskfile)
    render_to_facebox
  end

end

