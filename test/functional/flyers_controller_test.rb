require 'test_helper'

class FlyersControllerTest < ActionController::TestCase
  setup do
    @flyer = flyers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flyers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flyer" do
    assert_difference('Flyer.count') do
      post :create, flyer: { description: @flyer.description, title: @flyer.title }
    end

    assert_redirected_to flyer_path(assigns(:flyer))
  end

  test "should show flyer" do
    get :show, id: @flyer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flyer
    assert_response :success
  end

  test "should update flyer" do
    put :update, id: @flyer, flyer: { description: @flyer.description, title: @flyer.title }
    assert_redirected_to flyer_path(assigns(:flyer))
  end

  test "should destroy flyer" do
    assert_difference('Flyer.count', -1) do
      delete :destroy, id: @flyer
    end

    assert_redirected_to flyers_path
  end
end
