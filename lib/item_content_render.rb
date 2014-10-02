class ItemContentRender < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def block_code code, language
    Pygments.highlight code, lexer: language
  end

  def table header, body
    <<HTML
<table class="pure-table">
  <thead>#{header}</thead>
  <tbody>#{body}</tbody>
</table>
HTML
  end

  def image link, title, alt_text
    %Q{<img class="pure-img" src="#{link}" title="#{title}" alt="#{alt_text}">}
  end

  def postprocess full_document
    add_class = -> element, class_name do
      element['class'] = "#{element['class'] || ''} #{class_name}"
    end
    fragment = Nokogiri::HTML.fragment full_document
    fragment.css('button').each{|button| add_class.call button, 'pure-button' }
    fragment.css('form').each{|form| add_class.call form, 'pure-form' }
    fragment.css('tbody tr:nth-child(odd)').
      each{|tr| add_class.call tr, 'pure-table-odd' }
    fragment.to_html
  end
end
