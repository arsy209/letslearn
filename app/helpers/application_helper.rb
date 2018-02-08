module ApplicationHelper
  def avatar_url
    return "#{current_user.avatar}&height=50&width=50" if current_user.avatar
    current_user.photo_url(:thumb) || "http://placehold.it/30x30"
  end

  def photo_url(user)
    return "#{user.avatar}&height=200&width=200" if user.avatar
    user.photo_url(:profile) || "http://placehold.it/30x30"
  end

  def teacher_photo(skill)
    return "#{skill.teacher.avatar}&height=50&width=50" if skill.teacher.avatar
    skill.teacher.photo.url(:thumb) ||
    "http://placehold.it/30x30"
  end

  def small_user_photo(user)
    return "#{user.avatar}&height=50&width=50" if user.avatar
    user.photo.url(:thumb) || "http://placehold.it/30x30"
  end

  def meetup_image(group)
    if !group['key_photo'].nil?
      "#{group['key_photo']['photo_link']}"  || 'http://cdn.embed.ly/providers/logos/meetup.png'
    else
      'http://cdn.embed.ly/providers/logos/meetup.png'
    end
  end

  def title(text)
    content_for :title, text
  end

  def resource_name
   :user
  end

 def resource
   @resource ||= User.new
 end
end
