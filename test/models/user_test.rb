require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save invalid sign up' do

      user = User.new
      user.email = "me@gmail.com"
      user.save
      refute user.valid?
    end


      test 'should not save invalid sign up 2' do

        user = User.new
        user.save
        refute user.valid?
      end


      test 'should save valid sign up' do

        user = User.new(email:"me@test.com", password: "testpassword", password_confirmation: "testpassword", admin: true )
        user.save
        assert user.valid?

      end

      test 'should not save user with differnent confirmation password' do
        #confirmation pass changed below
        user = User.new(email:"me@test.com", password: "testpass", password_confirmation: "testpassword", admin: true )
        user.save
        refute user.valid?

      end


      test 'second user is not an admin' do
        user = User.new(email:"duplicate@email.com", password: "testpassword", password_confirmation: "testpassword")
        user.save
        assert user.admin?

        user1 = User.new(email:"duplicate@email.com", password: "testpassword", password_confirmation: "testpassword")
        user1.save
        refute user1.admin?
      end



end
