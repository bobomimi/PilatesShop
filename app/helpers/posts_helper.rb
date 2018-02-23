module PostsHelper
	def cache_key_for_post
		count          = Post.count
		max_updated_at = Post.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"post/all-#{count}-#{max_updated_at}"
	end
end
