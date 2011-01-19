## Redmine Outlook .MSG Preview

This plugin to [Redmine](http://redmine.org) parses Microsoft Outlook MSG
file attachments within an issues attachment list. These attachments can then
be opened and viewed directly within Redmine without needing an instance of
Outlook installed on your local machine.

## Props

This plugin wouldn't be possible without

* [ruby-msg](https://github.com/aquasync/ruby-msg)
* [FaceboxRender](https://github.com/ihower/facebox_render)

## Version History

0.0.2 - 2011-JAN-19

- Fixed properties not being parsed consistently for certain attachments
- Preview now opens the message body in an iframe to prevent style overwrites

0.0.1 - 2010-DEC-24

Initial release

