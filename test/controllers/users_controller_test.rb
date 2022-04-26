require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup { @user = users(:one) }

  test 'should get index' do
    get users_url, as: :json
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url,
           params: {
             user: {
               avatar: @user.avatar,
               email: @user.email,
               first_name: @user.first_name,
               is_team_lead: @user.is_team_lead,
               last_name: @user.last_name,
               password_digest: @user.password_digest,
               role: @user.role,
               team_id: @user.team_id,
               username: @user.username
             }
           },
           as: :json
    end

    assert_response :created
  end

  test 'should show user' do
    get user_url(@user), as: :json
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user),
          params: {
            user: {
              avatar: @user.avatar,
              email: @user.email,
              first_name: @user.first_name,
              is_team_lead: @user.is_team_lead,
              last_name: @user.last_name,
              password_digest: @user.password_digest,
              role: @user.role,
              team_id: @user.team_id,
              username: @user.username
            }
          },
          as: :json
    assert_response :success
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) { delete user_url(@user), as: :json }

    assert_response :no_content
  end
end
