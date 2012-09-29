require 'helper'

describe BeautifulCss::Css do

  before do
    @subject = BeautifulCss::Css.new ''
  end

  it 'should be a class' do
    @subject.class.name.must_match 'Css'
  end

  it 'should respond to render' do
    assert_respond_to @subject, :render
  end

end
