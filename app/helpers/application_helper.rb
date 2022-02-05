module ApplicationHelper
  BASE_TITLE = "韓ドラレビュー".freeze

  def full_title(pagetitle)
    pagetitle.blank? ? BASE_TITLE : "#{pagetitle} - #{BASE_TITLE}"
  end

  def load_user
    return current_user
  end
end
