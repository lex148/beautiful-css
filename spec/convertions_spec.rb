require 'helper'

describe BeautifulCss::Css do

  it 'nothing to nothing' do
    assert_renders <<DIRTY, <<CLEAN
DIRTY
CLEAN
  end

  it 'vanila style' do
    assert_renders <<DIRTY, <<CLEAN
a { color:red; }
DIRTY
a
{ color:red }
CLEAN
  end


  def assert_renders(dirty,clean)
    assert_equal convert(dirty), clean
  end

  def convert(css)
    BeautifulCss::Css.new(css).render
  end

end
