require 'test_helper'

class ScrapebotsControllerTest < ActionController::TestCase
  setup do
    @scrapebot = scrapebots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapebots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrapebot" do
    assert_difference('Scrapebot.count') do
      post :create, scrapebot: { bio: @scrapebot.bio, game: @scrapebot.game, name: @scrapebot.name, stream_count: @scrapebot.stream_count, stream_item_count: @scrapebot.stream_item_count }
    end

    assert_redirected_to scrapebot_path(assigns(:scrapebot))
  end

  test "should show scrapebot" do
    get :show, id: @scrapebot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrapebot
    assert_response :success
  end

  test "should update scrapebot" do
    put :update, id: @scrapebot, scrapebot: { bio: @scrapebot.bio, game: @scrapebot.game, name: @scrapebot.name, stream_count: @scrapebot.stream_count, stream_item_count: @scrapebot.stream_item_count }
    assert_redirected_to scrapebot_path(assigns(:scrapebot))
  end

  test "should destroy scrapebot" do
    assert_difference('Scrapebot.count', -1) do
      delete :destroy, id: @scrapebot
    end

    assert_redirected_to scrapebots_path
  end
end
