require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:four)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { } }
    end
    assert_redirected_to login_url
  end

  test "should redirect delete when not logged in" do
    assert_no_difference 'Post.count' do
      delete post_path(@post)
    end
    assert_redirected_to login_url
  end

  test "should redirect delete for wrong post" do
    log_in_as(users(:jose))
    post = posts(:five)
    assert_no_difference 'Post.count' do
      delete post_path(post)
    end
    assert_redirected_to root_url
  end
end