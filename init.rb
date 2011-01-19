require 'redmine'

Redmine::Plugin.register :redmine_msg_preview do
  name        'Outlook MSG Preview'
  author      'Alex Bevilacqua'
  url         'http://www.alexbevi.com/projects/redmine-msg-preview'
  author_url  'http://blog.alexbevi.com'
  description 'Allow previewing of Microsoft Outlook .msg file attachments'
  version     '0.0.2'
end

class RedmineMSGPreviewHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_description_bottom, :partial => 'msg_list'
end

module MsgHelper
  module PublicMethods
    
    def lookup_property(msg, prop)
      case prop.upcase
        when "SENDER":
          return msg.properties.sent_representing_name
        when "SUBJECT"
          return msg.properties.subject
        when "CREATION_TIME"
          return msg.properties.creation_time.to_s
      end
    end
    
  end
end

ActionView::Base.send :include, MsgHelper::PublicMethods

