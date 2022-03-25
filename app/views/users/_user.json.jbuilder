json.name user.name
json.email user.email
json.role user.role
json.slug user.slug
json.bio user.bio
json.cats_or_dogs user.cats_or_dogs
json.coffee_or_tea user.coffee_or_tea
json.glasses user.glasses
json.patat_or_friet user.patat_or_friet
json.music user.music
json.height user.height
json.shape user.shape
json.image_url url_for(user.avatar) if user.avatar.attached?