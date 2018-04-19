json.count @count
json.like_count @like_count
json.current_user user_signed_in?
json.array @liked_user_array.include?(current_user.id)
