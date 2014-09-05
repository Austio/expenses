require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "Will not create duplicate accounts"  do
    post '/api/accounts?email=a@doughboy.com'
    resp = jsonify(response.body)
    assert_equal resp[:message], "Duplicate Username!"
    assert_equal resp[:success], false
  end

  test "Requires password"  do
    post '/api/accounts?email=anew@doughboy.com'
    resp = jsonify(response.body)
    assert_equal resp[:message], "Please enter a password"
    assert_equal resp[:success], false
  end

  test "Creats account for new user"  do
    User.any_instance.stubs(:set_token).returns("BucketsO'Fun")
    post '/api/accounts?email=ane2@doughboy.com&password=linebacker'
    resp = jsonify(response.body)
    assert_includes resp[:message], "Account Created"
    assert_equal resp[:success], true
    assert_equal resp[:token], "BucketsO'Fun"
  end

end