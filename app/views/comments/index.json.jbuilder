json.array! @update_comments do |comment|
  json.user_name comment.user.name
  json.content comment.content
  json.user_avatar comment.user.avatar.url
  json.count @comments.count
  json.id comment.id
end