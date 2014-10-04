module ItemsHelper
  # @param [string] content
  # @param [integer] length
  # @return [string]
  def render_markdown content, length = 0
    markdown = Redcarpet::Markdown.new ItemContentRender,
      autolink: true,
      tables: true,
      fenced_code_blocks: true
    markdown.render(content).
      tap {|html| break HTML_Truncator.truncate(html, length, length_in_chars: true) if length > 0 }
  end
end
