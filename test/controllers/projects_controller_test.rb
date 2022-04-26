require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup { @project = projects(:one) }

  test 'should get index' do
    get projects_url, as: :json
    assert_response :success
  end

  test 'should create project' do
    assert_difference('Project.count') do
      post projects_url,
           params: {
             project: {
               actual_end_date: @project.actual_end_date,
               bug_id: @project.bug_id,
               created_by: @project.created_by,
               modified_by: @project.modified_by,
               project_name: @project.project_name,
               start_date: @project.start_date,
               target_end_date: @project.target_end_date,
               team_id: @project.team_id
             }
           },
           as: :json
    end

    assert_response :created
  end

  test 'should show project' do
    get project_url(@project), as: :json
    assert_response :success
  end

  test 'should update project' do
    patch project_url(@project),
          params: {
            project: {
              actual_end_date: @project.actual_end_date,
              bug_id: @project.bug_id,
              created_by: @project.created_by,
              modified_by: @project.modified_by,
              project_name: @project.project_name,
              start_date: @project.start_date,
              target_end_date: @project.target_end_date,
              team_id: @project.team_id
            }
          },
          as: :json
    assert_response :success
  end

  test 'should destroy project' do
    assert_difference('Project.count', -1) do
      delete project_url(@project), as: :json
    end

    assert_response :no_content
  end
end
