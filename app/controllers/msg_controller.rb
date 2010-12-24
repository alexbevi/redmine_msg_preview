class MsgController < ApplicationController
  unloadable

  include FaceboxRender

  def show
    @msg = Mapi::Msg.open params[:diskfile]
    render_to_facebox
  end

end

