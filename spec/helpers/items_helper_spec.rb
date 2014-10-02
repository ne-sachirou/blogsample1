require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ItemCategoriesHelper. For example:
#
# describe ItemCategoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ItemsHelper, :type => :helper do
  describe 'block_code' do
  end

  describe 'table' do
    it '.pure-table inserted' do
      markdown = <<'HTML'
| th | th |
|----|----|
| td | td |
| td | td |
HTML
      expected = <<'HTML'
<table class="pure-table">
  <thead>
<tr>
<th>th</th>
<th>th</th>
</tr>
</thead>
  <tbody>
<tr class=" pure-table-odd">
<td>td</td>
<td>td</td>
</tr>
<tr>
<td>td</td>
<td>td</td>
</tr>
</tbody>
</table>
HTML
      expect(helper.render_markdown markdown).to eq expected
    end
  end

  describe 'image' do
    it '.pure-img inserted' do
      markdown = '![alt](src.webp)'
      expected = %Q{<p><img class="pure-img" src="src.webp" title="" alt="alt"></p>\n}
      expect(helper.render_markdown markdown).to eq expected
    end
  end

  describe 'postprocess button' do
    it '.pure-button inserted' do
      markdown = '<button>btn</button>'
      expected = %Q{<p><button class=" pure-button">btn</button></p>\n}
      expect(helper.render_markdown markdown).to eq expected
    end
  end

  describe 'postprocess form' do
    it '.pure-form inserted' do
      markdown = '<form>form</form>'
      expected = %Q{<form class=" pure-form">form</form>\n}
      expect(helper.render_markdown markdown).to eq expected
    end
  end

  describe 'postprocess tr:odd' do
  end
end
