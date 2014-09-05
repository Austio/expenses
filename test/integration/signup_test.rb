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

end