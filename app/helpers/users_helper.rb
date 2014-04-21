module UsersHelper
	def gravatar_for(user, options={})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		options.each do |key, value|
			gravatar_url += "?" + key.to_s + "=" + value.to_s
		end
		image_tag(gravatar_url, alt:user.name, class: "gravatar")
	end
end
