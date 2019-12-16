require 'test_helper'

class BookTest < ActiveSupport::TestCase



  test 'should save valid author' do

    author = Author.new
    author.name = 'JK Rowling'
    author.save
    assert author.valid?
  end


  test 'should not save invalid author without name' do
    author = Author.new
    author.save
    refute author.valid?

  end



end
