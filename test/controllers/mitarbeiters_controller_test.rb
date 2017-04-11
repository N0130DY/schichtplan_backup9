require 'test_helper'

class MitarbeitersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mitarbeiter = mitarbeiters(:one)
  end

  test "should get index" do
    get mitarbeiters_url
    assert_response :success
  end

  test "should get new" do
    get new_mitarbeiter_url
    assert_response :success
  end

  test "should create mitarbeiter" do
    assert_difference('Mitarbeiter.count') do
      post mitarbeiters_url, params: { mitarbeiter: { duration: @mitarbeiter.duration, parent: @mitarbeiter.parent, start_date: @mitarbeiter.start_date, status: @mitarbeiter.status, text: @mitarbeiter.text, user: @mitarbeiter.user, user_id: @mitarbeiter.user_id } }
    end

    assert_redirected_to mitarbeiter_url(Mitarbeiter.last)
  end

  test "should show mitarbeiter" do
    get mitarbeiter_url(@mitarbeiter)
    assert_response :success
  end

  test "should get edit" do
    get edit_mitarbeiter_url(@mitarbeiter)
    assert_response :success
  end

  test "should update mitarbeiter" do
    patch mitarbeiter_url(@mitarbeiter), params: { mitarbeiter: { duration: @mitarbeiter.duration, parent: @mitarbeiter.parent, start_date: @mitarbeiter.start_date, status: @mitarbeiter.status, text: @mitarbeiter.text, user: @mitarbeiter.user, user_id: @mitarbeiter.user_id } }
    assert_redirected_to mitarbeiter_url(@mitarbeiter)
  end

  test "should destroy mitarbeiter" do
    assert_difference('Mitarbeiter.count', -1) do
      delete mitarbeiter_url(@mitarbeiter)
    end

    assert_redirected_to mitarbeiters_url
  end
end
