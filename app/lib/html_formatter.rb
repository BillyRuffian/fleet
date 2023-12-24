module HtmlFormatter
  def self.md_to_html(text)
    coderayified = CodeRayify.new(filter_html: true, 
                                  hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      strikethrough: true,
      lax_html_blocks: true,
      superscript: true,
      tables: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true
    }
    
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end