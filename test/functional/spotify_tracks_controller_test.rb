require 'test_helper'

class SpotifyTracksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spotify_tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spotify_track" do
    assert_difference('SpotifyTrack.count') do
      post :create, :spotify_track => { }
    end

    assert_redirected_to spotify_track_path(assigns(:spotify_track))
  end

  test "should show spotify_track" do
    get :show, :id => spotify_tracks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => spotify_tracks(:one).to_param
    assert_response :success
  end

  test "should update spotify_track" do
    put :update, :id => spotify_tracks(:one).to_param, :spotify_track => { }
    assert_redirected_to spotify_track_path(assigns(:spotify_track))
  end

  test "should destroy spotify_track" do
    assert_difference('SpotifyTrack.count', -1) do
      delete :destroy, :id => spotify_tracks(:one).to_param
    end

    assert_redirected_to spotify_tracks_path
  end
end
