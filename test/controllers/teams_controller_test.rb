require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup { @team = teams(:one) }

  test 'should get index' do
    get teams_url, as: :json
    assert_response :success
  end

  test 'should create team' do
    assert_difference('Team.count') do
      post teams_url,
           params: {
             team: {
               created_by: @team.created_by,
               lead_id: @team.lead_id,
               modified_by: @team.modified_by,
               team_name: @team.team_name
             }
           },
           as: :json
    end

    assert_response :created
  end

  test 'should show team' do
    get team_url(@team), as: :json
    assert_response :success
  end

  test 'should update team' do
    patch team_url(@team),
          params: {
            team: {
              created_by: @team.created_by,
              lead_id: @team.lead_id,
              modified_by: @team.modified_by,
              team_name: @team.team_name
            }
          },
          as: :json
    assert_response :success
  end

  test 'should destroy team' do
    assert_difference('Team.count', -1) { delete team_url(@team), as: :json }

    assert_response :no_content
  end
end
