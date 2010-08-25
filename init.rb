require 'redmine'

Redmine::Plugin.register :redmine_msg_preview do
  name 'Outlook MSG Preview'
  author 'Alex Bevilacqua'
  description 'Allow previewing of Microsoft Outlook .msg file attachments'
  version '0.0.1'
end

class RedmineScreenshotPasteHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_description_bottom, :partial => 'msg_preview'
end