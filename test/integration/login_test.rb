require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "Validates user is in system"  do
    post '/api/sessions?email=unknown@thundercats.com'
    resp = jsonify(response.body)
    assert_equal "Username Not Found",resp[:message]
    assert_equal false, resp[:success]
    assert_equal nil, resp[:token]
  end

  test "Validates password correctness"  do
    post '/api/sessions?email=a@doughboy.com&password=RandomishGuess'
    resp = jsonify(response.body)
    assert_equal "Please Check Password", resp[:message]
    assert_equal false, resp[:success]
    assert_equal nil, resp[:token]
  end

  test "Signs in valid accounts returning token"  do
    User.any_instance.stubs(:set_token).returns("OfSwordAndIce")
    post '/api/sessions?email=a@doughboy.com&password=linebacker'

    resp = jsonify(response.body)
    assert_equal "Successfully Logged In!", resp[:message]
    assert_equal true, resp[:success]
    assert_equal "OfSwordAndIce", resp[:token]
  end

end