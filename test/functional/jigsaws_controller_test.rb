require 'test_helper'

class JigsawsControllerTest < ActionController::TestCase
  setup do
    @jigsaw = jigsaws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jigsaws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jigsaw" do
    assert_difference('Jigsaw.count') do
      post :create, jigsaw: { description: @jigsaw.description, name: @jigsaw.name }
    end

    assert_redirected_to jigsaw_path(assigns(:jigsaw))
  end

  test "should show jigsaw" do
    get :show, id: @jigsaw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jigsaw
    assert_response :success
  end

  test "should update jigsaw" do
    put :update, id: @jigsaw, jigsaw: { description: @jigsaw.description, name: @jigsaw.name }
    assert_redirected_to jigsaw_path(assigns(:jigsaw))
  end

  test "should destroy jigsaw" do
    assert_difference('Jigsaw.count', -1) do
      delete :destroy, id: @jigsaw
    end

    assert_redirected_to jigsaws_path
  end
end
