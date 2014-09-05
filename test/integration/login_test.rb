require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "Validates user is in system"  do
    post '/api/sessions?email=unknown@thundercats.com'
    resp = jsonify(response.body)
    assert_equal resp[:message], "Username Not Found"
    assert_equal resp[:success], false
    assert_equal resp[:token], nil
  end

  test "Validates password correctness"  do
    post '/api/sessions?email=a@doughboy.com&password=RandomishGuess'
    resp = jsonify(response.body)
    assert_equal resp[:message], "Please Check Password"
    assert_equal resp[:success], false
    assert_equal resp[:token], nil
  end

  test "Signs in valid accounts returning token"  do
    User.any_instance.stubs(:set_token).returns("OfSwordAndIce")
    post '/api/sessions?email=a@doughboy.com&password=linebacker'

    resp = jsonify(response.body)
    assert_includes resp[:message], "Successfully Logged In"
    assert_equal resp[:success], true
    assert_equal resp[:token], "OfSwordAndIce"
  end

end