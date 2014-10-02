module ItemsHelper
  # @param [string] content
  # @return [string]
  def render_markdown content
    markdown = Redcarpet::Markdown.new ItemContentRender,
      autolink: true,
      tables: true,
      fenced_code_blocks: true
    markdown.render content
  end
end
