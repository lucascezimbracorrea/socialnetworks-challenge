
class SocialNetworksSearchControllerTest < ActionDispatch::IntegrationTest
  test "contains all social networks" do
    get "/"
    _json_response = JSON.parse(response.body)

    assert_equal true, _json_response.key?('twitter')
    assert_equal true, _json_response.key?('facebook')
    assert_equal true, _json_response.key?('instagram')
  end
  
  test "are not empty social networks" do
    get "/"
    _json_response = JSON.parse(response.body)

    assert_not_equal [], _json_response['twitter']
    assert_not_equal [], _json_response['facebook']
    assert_not_equal [], _json_response['instagram']
  end
end
