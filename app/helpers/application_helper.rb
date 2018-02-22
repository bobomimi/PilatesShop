module ApplicationHelper
  def title(blog_title)
    content_for(:title) { blog_title }
  end

  def meta_description(blog_text)
    content_for(:meta_description) { blog_text }
  end

end
