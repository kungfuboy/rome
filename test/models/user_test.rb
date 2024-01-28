require 'test_helper'

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.new(username: 'John', password: 'password', password_confirmation: 'password')
    end

    test 'should be valid' do
        assert @user.valid?
    end

    test 'username should be present' do
        @user.username = '  '
        assert_not @user.valid?
    end

    # not work
    test 'password should be present (not blank also)' do
        @user.password = @user.password_confirmation = ' ' * 8
        assert_not @user.valid?
    end

    test 'username should not be too long' do
        @user.username = 'a' * 11
        assert_not @user.valid?
    end

    test 'password should not be too long' do
        @user.password = @user.password_confirmation = 'a' * 30
        assert_not @user.valid?
    end

    test 'password should not be too short' do
        @user.password = @user.password_confirmation = 'a' * 7
        assert_not @user.valid?
    end

    # test 'password must be include number and letter' do
    #     valid_password = %w[768687578687 hoiuhudw]
    #     valid_password.each do |data|
    #         @user.password = data
    #         puts data
    #         assert_not @user.valid?
    #     end
    # end

    test 'username should be unique' do
        duplicate_user = @user.dup
        duplicate_user.username = @user.username.upcase
        @user.save
        assert_not duplicate_user.valid?
    end
end
