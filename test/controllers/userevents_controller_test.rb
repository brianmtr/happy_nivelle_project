require "test_helper"

class UsereventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userevent = userevents(:one)
  end

  test "should get index" do
    get userevents_url
    assert_response :success
  end

  test "should get new" do
    get new_userevent_url
    assert_response :success
  end

  test "should create userevent" do
    assert_difference('Userevent.count') do
      post userevents_url, params: { userevent: {  } }
    end

    assert_redirected_to userevent_url(Userevent.last)
  end

  test "should show userevent" do
    get userevent_url(@userevent)
    assert_response :success
  end

  test "should get edit" do
    get edit_userevent_url(@userevent)
    assert_response :success
  end

  test "should update userevent" do
    patch userevent_url(@userevent), params: { userevent: {  } }
    assert_redirected_to userevent_url(@userevent)
  end

  test "should destroy userevent" do
    assert_difference('Userevent.count', -1) do
      delete userevent_url(@userevent)
    end

    assert_redirected_to userevents_url
  end
end
