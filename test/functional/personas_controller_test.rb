require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, :persona => { }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, :id => personas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => personas(:one).id
    assert_response :success
  end

  test "should update persona" do
    put :update, :id => personas(:one).id, :persona => { }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, :id => personas(:one).id
    end

    assert_redirected_to personas_path
  end
end
