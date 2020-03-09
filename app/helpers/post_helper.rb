module PostHelper

  def sort_categories(categories)
    if categories.include? nil
      # sort categories with nil
      categories.delete nil
      categories.sort!.push nil
    else
      # sort categories without nil
      categories.sort!
    end
    categories
  end

  def set_checked_categories(default: nil)
    categories = params.fetch(:categories, nil)
    if categories != nil
      # convert 'nil' to nil
      if categories['nil'] != nil
        categories[nil] = 1
      end
      session[:categories] = categories.keys
    else
      session[:categories] = default
    end
  end

  def authorize_to_edit? (post, redirect_path: root_path)
    if @current_user.email != post.user_id
      flash[:warning] = "You are not authorized to edit this post"
      redirect_to redirect_path
      return false
    end
    true
  end
end
