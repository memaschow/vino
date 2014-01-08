require 'test_helper'

class VinosControllerTest < ActionController::TestCase
  setup do
    @vino = vinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vino" do
    assert_difference('Vino.count') do
      post :create, vino: { discription: @vino.discription, name: @vino.name }
    end

    assert_redirected_to vino_path(assigns(:vino))
  end

  test "should show vino" do
    get :show, id: @vino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vino
    assert_response :success
  end

  test "should update vino" do
    patch :update, id: @vino, vino: { discription: @vino.discription, name: @vino.name }
    assert_redirected_to vino_path(assigns(:vino))
  end

  test "should destroy vino" do
    assert_difference('Vino.count', -1) do
      delete :destroy, id: @vino
    end

    assert_redirected_to vinos_path
  end
end
