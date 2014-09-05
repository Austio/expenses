require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "Will not create duplicate accounts"  do
    post '/api/accounts?email=a@doughboy.com'
    resp = jsonify(response.body)
    assert_equal  "Duplicate Username!", resp[:message]
    assert_equal false, resp[:success]
  end

  test "Requires password"  do
    post '/api/accounts?email=anew@doughboy.com'
    resp = jsonify(response.body)
    assert_equal "Please enter a password", resp[:message]
    assert_equal false, resp[:success]
  end

  test "Creats account for new user"  do
    User.any_instance.stubs(:set_token).returns("BucketsO'Fun")
    post '/api/accounts?email=ane2@doughboy.com&password=linebacker'
    resp = jsonify(response.body)
    assert_equal "Account Created, Logging In!", resp[:message]
    assert_equal true, resp[:success]
    assert_equal "BucketsO'Fun", resp[:token]
  end

end