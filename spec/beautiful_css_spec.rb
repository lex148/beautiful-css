require 'helper'

describe BeautifulCss::Engine do

  before do
    @subject = BeautifulCss::Engine.new ''
  end

  it 'should be a class' do
    @subject.class.name.must_match 'Css'
  end

  it 'should respond to render' do
    assert_respond_to @subject, :render
  end

end
