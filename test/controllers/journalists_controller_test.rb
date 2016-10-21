require 'test_helper'

class JournalistsControllerTest < ActionController::TestCase
  setup do
    @journalist = journalists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journalists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journalist" do
    assert_difference('Journalist.count') do
      post :create, journalist: { cpf: @journalist.cpf, name: @journalist.name }
    end

    assert_redirected_to journalist_path(assigns(:journalist))
  end

  test "should show journalist" do
    get :show, id: @journalist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journalist
    assert_response :success
  end

  test "should update journalist" do
    patch :update, id: @journalist, journalist: { cpf: @journalist.cpf, name: @journalist.name }
    assert_redirected_to journalist_path(assigns(:journalist))
  end

  test "should destroy journalist" do
    assert_difference('Journalist.count', -1) do
      delete :destroy, id: @journalist
    end

    assert_redirected_to journalists_path
  end
end
