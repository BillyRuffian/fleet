class Post < ApplicationRecord
  def updated_since_creation?
    created_at != updated_at
  end

  def adoc
    Asciidoctor
      .convert(body, attributes: { 'source-highlighter' => 'rouge', 'rouge-css' => 'style', 'rouge-style' => 'gruvbox' })
      .html_safe
  end

end
