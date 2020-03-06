module ApplicationHelper
  def get_post_object(object_name)
    params.require object_name
  end
end
