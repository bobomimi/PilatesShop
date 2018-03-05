module ApplicationHelper
  def title(blog_title)
    content_for(:title) { blog_title }
  end

  def meta_description(blog_text)
    content_for(:meta_description) { blog_text }
  end

  def meta_og_tags(properties = {})
    return unless properties.is_a? Hash

    tags = []

    properties.each do |property, value|
      tags << tag(:meta, property: "og:#{property}", content: value)
    end

    tags.join.html_safe  # Remember in Ruby the last line is returned
  end
  

end
