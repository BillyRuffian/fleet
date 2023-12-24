class Post < ApplicationRecord
  before_validation :slugify

  validates_presence_of :title, :body
  validates_uniqueness_of :title, case_sensitive: false

  def updated_since_creation?
    created_at != updated_at
  end

  def formatted
    HtmlFormatter.md_to_html(body)
  end

  private

  def slugify
    self.slug = title.parameterize
  end

end
