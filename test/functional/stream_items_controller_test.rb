require 'test_helper'

class StreamItemsControllerTest < ActionController::TestCase
  setup do
    @stream_item = stream_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stream_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stream_item" do
    assert_difference('StreamItem.count') do
      post :create, stream_item: { body: @stream_item.body, by_line: @stream_item.by_line, item_link: @stream_item.item_link, picture: @stream_item.picture, replies: @stream_item.replies, stream_id: @stream_item.stream_id, title: @stream_item.title, views: @stream_item.views }
    end

    assert_redirected_to stream_item_path(assigns(:stream_item))
  end

  test "should show stream_item" do
    get :show, id: @stream_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stream_item
    assert_response :success
  end

  test "should update stream_item" do
    put :update, id: @stream_item, stream_item: { body: @stream_item.body, by_line: @stream_item.by_line, item_link: @stream_item.item_link, picture: @stream_item.picture, replies: @stream_item.replies, stream_id: @stream_item.stream_id, title: @stream_item.title, views: @stream_item.views }
    assert_redirected_to stream_item_path(assigns(:stream_item))
  end

  test "should destroy stream_item" do
    assert_difference('StreamItem.count', -1) do
      delete :destroy, id: @stream_item
    end

    assert_redirected_to stream_items_path
  end
end
