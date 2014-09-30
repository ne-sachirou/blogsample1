class ItemContentRender < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def table header, body
    <<HTML
<table class="pure-table">
  <thead>#{header}</thead>
  <tbody>#{body}</tbody>
</table>
HTML
  end

  def block_code code, language
    Pygments.highlight code, lexer: language
  end
end
