require 'redmine'

Redmine::Plugin.register :redmine_msg_preview do
  name        'Outlook MSG Preview'
  author      'Alex Bevilacqua'
  url         'http://www.alexbevi.com/projects/redmine-msg-preview'
  author_url  'http://blog.alexbevi.com'
  description 'Allow previewing of Microsoft Outlook .msg file attachments'
  version     '0.0.1'
end

class RedmineMSGPreviewHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_description_bottom, :partial => 'msg_list'
end

module MsgHelper
  module PublicMethods
    def sender_to_s(msg)
      sender_name =  msg.properties[0x3FF8]
      sender_email = msg.properties[0x0C1F]

      "#{sender_name.titlecase} [#{sender_email.downcase}]"
    end
  end
end

ActionView::Base.send :include, MsgHelper::PublicMethods

