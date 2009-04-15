require 'test_helper'

class UejecutorasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uejecutoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uejecutora" do
    assert_difference('Uejecutora.count') do
      post :create, :uejecutora => { }
    end

    assert_redirected_to uejecutora_path(assigns(:uejecutora))
  end

  test "should show uejecutora" do
    get :show, :id => uejecutoras(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => uejecutoras(:one).id
    assert_response :success
  end

  test "should update uejecutora" do
    put :update, :id => uejecutoras(:one).id, :uejecutora => { }
    assert_redirected_to uejecutora_path(assigns(:uejecutora))
  end

  test "should destroy uejecutora" do
    assert_difference('Uejecutora.count', -1) do
      delete :destroy, :id => uejecutoras(:one).id
    end

    assert_redirected_to uejecutoras_path
  end
end
