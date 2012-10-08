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





  it 'should work with three styles' do
    dirty = <<DIRTY
a
{
  color:red;
  background-color:blue;
}

.classy
{
  color:green;
}
DIRTY
    clean = <<CLEAN
a
{ background-color:blue }

.classy
{ color:green }

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




  it 'should removed unset values' do
    dirty = <<DIRTY
a { color:green }
a { color:red }
DIRTY
    clean = <<CLEAN
a
{ color:red }
CLEAN
    assert_renders dirty, clean
  end



  it 'should group selectors' do
    dirty = <<DIRTY
a { color:green }
b { color:green }
DIRTY
    clean = <<CLEAN
a,
b
{ color:green }
CLEAN
    assert_renders dirty, clean
  end



  it 'should work with import' do
    dirty = <<DIRTY
@import url("blargs.css");
a { color:green }
DIRTY
    clean = <<CLEAN
@import url("blargs.css");

a
{ color:green }
CLEAN
    assert_renders dirty, clean
  end




  it 'should work with base64 encoded images' do
    dirty = <<DIRTY
a
{ background:url( data:image/png;base64,iVBORw0KGLKSsg= ); }
DIRTY
    clean = <<CLEAN
a
{ background:url(data:image/png;base64,iVBORw0KGLKSsg=) }
CLEAN
    assert_renders dirty, clean
  end





  it 'should ignore case for style' do
    dirty = <<DIRTY
a
{ background:green; }
a
{ BACKGROUND:green; }
DIRTY
    clean = <<CLEAN
a
{ background:green }
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
