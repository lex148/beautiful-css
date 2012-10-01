require 'helper'

describe BeautifulCss::Engine do

  it 'nothing to nothing' do
    assert_renders '', ''
  end



  it 'vanila style' do
    dirty = <<D
a
{ color:red }
D
    assert_renders dirty, dirty
  end





  it 'two styles' do
    dirty = <<DIRTY
a
{
  color:red;
  background-color:blue;
}
DIRTY
    clean = <<CLEAN
a
{ background-color:blue }

a
{ color:red }
CLEAN
    assert_renders dirty, clean
  end



  it 'should be alphabetical' do
    dirty = <<DIRTY
a
{ color:red }

a
{ background-color:blue }

DIRTY
    clean = <<CLEAN
a
{ background-color:blue }

a
{ color:red }
CLEAN
    assert_renders dirty, clean
  end






  it 'should be able to handle scss' do
    dirty = <<DIRTY
.classy {
  a
  { color:red }
}
DIRTY
    clean = <<CLEAN
.classy a
{ color:red }
CLEAN
    assert_renders dirty, clean
  end




  it 'should remove dups' do
    dirty = <<DIRTY
a { color:red }
a { color:red }
DIRTY
    clean = <<CLEAN
a
{ color:red }
CLEAN
    assert_renders dirty, clean
  end








  def assert_renders(dirty,clean)
    assert_equal clean.strip, convert(dirty).strip
  end

  def convert(css)
    BeautifulCss::Engine.new(css).render
  end

end
