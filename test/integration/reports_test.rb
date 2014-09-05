require 'test_helper'

class ReportsTest < ActionDispatch::IntegrationTest


  test "Provides reports to valid token"  do
    # Token.any_instance.stubs(:find).returns(Token.first)
    get '/api/reports', {}, {"HTTP_API_KEY" => "RandomText"}
    assert_equal '{"2014-33":{"amount":110000,"average":55000,"total_expenses":2}}',response.body
  end

  test "Renders unauthorized if no key" do
    get '/api/reports', {}, {"HTTP_API_KEY" => "HackedRandomGuess"}
    resp = jsonify(response.body)
    assert_equal "Unauthorized", resp[:message]
    assert_equal 403, response.status
  end

end