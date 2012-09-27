require 'test_helper'

class IntstructionsControllerTest < ActionController::TestCase
  setup do
    @intstruction = intstructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intstructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intstruction" do
    assert_difference('Intstruction.count') do
      post :create, intstruction: { body: @intstruction.body, featured: @intstruction.featured, instructor_id: @intstruction.instructor_id, status: @intstruction.status, title: @intstruction.title }
    end

    assert_redirected_to intstruction_path(assigns(:intstruction))
  end

  test "should show intstruction" do
    get :show, id: @intstruction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intstruction
    assert_response :success
  end

  test "should update intstruction" do
    put :update, id: @intstruction, intstruction: { body: @intstruction.body, featured: @intstruction.featured, instructor_id: @intstruction.instructor_id, status: @intstruction.status, title: @intstruction.title }
    assert_redirected_to intstruction_path(assigns(:intstruction))
  end

  test "should destroy intstruction" do
    assert_difference('Intstruction.count', -1) do
      delete :destroy, id: @intstruction
    end

    assert_redirected_to intstructions_path
  end
end
