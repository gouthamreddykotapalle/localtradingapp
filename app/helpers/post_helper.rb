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
end
