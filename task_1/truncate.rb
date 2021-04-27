module Truncate
  DEFAULT_OMISSION = '...'

  def truncate(attr_name, options = {})
    options = { omission: DEFAULT_OMISSION }.merge(options)
    define_method attr_name do
      msg = instance_variable_get("@#{attr_name}")
      msg.size > options[:length] ? msg.slice(0, options[:length]) << options[:omission] : msg
    end
  end
end
