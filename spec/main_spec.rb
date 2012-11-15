require 'helper'

describe Xavier::Main do

  before do
    @subject = Xavier::Main.new ''
  end

  it 'should be a class' do
    @subject.class.name.must_match 'Main'
  end

  #it 'should respond to render' do
  #  assert_respond_to @subject, :render
  #end

end
