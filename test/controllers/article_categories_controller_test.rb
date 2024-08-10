require "test_helper"

class ArticleCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get article_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get article_categories_show_url
    assert_response :success
  end
end
