require 'test_helper'

class BazsControllerTest < ActionController::TestCase
  setup do
    @baz = bazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baz" do
    assert_difference('Baz.count') do
      post :create, baz: { bar_id: @baz.bar_id, name: @baz.name }
    end

    assert_redirected_to baz_path(assigns(:baz))
  end

  test "should show baz" do
    get :show, id: @baz
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baz
    assert_response :success
  end

  test "should update baz" do
    patch :update, id: @baz, baz: { bar_id: @baz.bar_id, name: @baz.name }
    assert_redirected_to baz_path(assigns(:baz))
  end

  test "should destroy baz" do
    assert_difference('Baz.count', -1) do
      delete :destroy, id: @baz
    end

    assert_redirected_to bazs_path
  end
end
