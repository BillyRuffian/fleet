# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  published_at :datetime
#  draft        :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Post < ApplicationRecord
  has_rich_text :content

  default_scope { order(published_at: :DESC) }
end
