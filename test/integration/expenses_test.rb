require 'test_helper'

class ExpensesTest < ActionDispatch::IntegrationTest

  #Invalid Users
  test 'invalid index' do
    get 'api/expenses'
    resp = jsonify(response.body)
    assert_equal 403, response.status
    assert_equal "Unauthorized", resp[:message]
  end
  test 'invalid show' do
    get 'api/expenses/1'
    resp = jsonify(response.body)
    assert_equal 403, response.status
    assert_equal "Unauthorized", resp[:message]
  end
  test 'invalid create' do
    post 'api/expenses', {:amount => 50, :description => "Hiya!"}
    resp = jsonify(response.body)
    assert_equal 403, response.status
    assert_equal "Unauthorized", resp[:message]
  end
  test 'invalid update' do
    put 'api/expenses/1', {:amount => 29}
    resp = jsonify(response.body)
    assert_equal 403, response.status
    assert_equal "Unauthorized", resp[:message]
    assert_equal 100000, Expense.find(1).amount
  end
  test 'invalid destroy' do
    delete 'api/expenses/1'
    resp = jsonify(response.body)
    assert_equal 403, response.status
    assert_equal "Unauthorized", resp[:message]
    assert_equal 1, Expense.find(1).id
  end

  #VALID Responses
  test 'valid index' do
    get 'api/expenses', {}, {"HTTP_API_KEY" => "RandomText"}
    resp = jsonify(response.body)
    assert_equal User.find(1).expenses.count, resp[:expenses].count
    assert_equal 100000, resp[:expenses][0][:amount]
    assert_equal 10000, resp[:expenses][1][:amount]
    assert_equal 200, response.status
  end
  test 'valid show' do
    get 'api/expenses/1', {}, {"HTTP_API_KEY" => "RandomText"}
    resp = jsonify(response.body)
    assert_equal 100000, resp[:expense][:amount]
    assert_equal "Night on the town", resp[:expense][:description]
    assert_equal 200, response.status
  end

  test 'valid create' do
    post 'api/expenses', {'expense' => {'amount' => 50, 'description' => "Howdy!"}}, {"HTTP_API_KEY" => "RandomText"}
    resp = jsonify(response.body)
    assert_equal 200, response.status
    assert_equal "Howdy!", User.find(1).expenses.last.description
  end

  test 'valid update' do
    put 'api/expenses/1', {'expense' => {'amount' => 29}}, {"HTTP_API_KEY" => "RandomText"}
    assert_equal 29, Expense.find(1).amount
    assert_equal 200, response.status
  end
  # test 'valid destroy' do
  #   delete 'api/expenses/1'
  #   resp = jsonify(response.body)
  #   assert_equal 403, response.status
  #   assert_equal "Unauthorized", resp[:message]
  #   assert_equal 1, Expense.find(1).id
  # end



end