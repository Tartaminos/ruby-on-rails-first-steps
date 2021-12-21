require 'test_helper'

class CebolinhasControllerTest < ActionController::TestCase
  setup do
    @cebolinha = cebolinhas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cebolinhas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cebolinha" do
    assert_difference('Cebolinha.count') do
      post :create, cebolinha: { altura: @cebolinha.altura, cabelo: @cebolinha.cabelo, idade: @cebolinha.idade, olhos: @cebolinha.olhos, orelhas: @cebolinha.orelhas, vivo: @cebolinha.vivo }
    end

    assert_redirected_to cebolinha_path(assigns(:cebolinha))
  end

  test "should show cebolinha" do
    get :show, id: @cebolinha
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cebolinha
    assert_response :success
  end

  test "should update cebolinha" do
    put :update, id: @cebolinha, cebolinha: { altura: @cebolinha.altura, cabelo: @cebolinha.cabelo, idade: @cebolinha.idade, olhos: @cebolinha.olhos, orelhas: @cebolinha.orelhas, vivo: @cebolinha.vivo }
    assert_redirected_to cebolinha_path(assigns(:cebolinha))
  end

  test "should destroy cebolinha" do
    assert_difference('Cebolinha.count', -1) do
      delete :destroy, id: @cebolinha
    end

    assert_redirected_to cebolinhas_path
  end
end
