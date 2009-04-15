require 'test_helper'

class DoctiposControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doctipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doctipo" do
    assert_difference('Doctipo.count') do
      post :create, :doctipo => { }
    end

    assert_redirected_to doctipo_path(assigns(:doctipo))
  end

  test "should show doctipo" do
    get :show, :id => doctipos(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doctipos(:one).id
    assert_response :success
  end

  test "should update doctipo" do
    put :update, :id => doctipos(:one).id, :doctipo => { }
    assert_redirected_to doctipo_path(assigns(:doctipo))
  end

  test "should destroy doctipo" do
    assert_difference('Doctipo.count', -1) do
      delete :destroy, :id => doctipos(:one).id
    end

    assert_redirected_to doctipos_path
  end
end
