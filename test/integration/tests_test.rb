require "test_helper"
require "faker"

class TestsTest < ActionDispatch::IntegrationTest
  test "try to search" do
    get '/ind/main'
    assert_redirected_to '/session/login'
  end

  test 'wrong password' do 
    post session_create_url, params: {username: Faker::Name.name ,password: Faker::Number}
    assert_redirected_to "/session/login"
  end

  test "register then login the do search" do
    pass= Faker::Number
    name=Faker::Name.name

    # gets output from register url
    get "/users/new/"
    assert_response :success

    # Register
    post users_url, params: {user:{username:name, password: pass, password_confirmation:pass}}
    assert_response :redirect

    # log in
    post '/session/create', params: {username:name, password: pass}
    assert_response :redirect

    # # calc
    get '/ind/view'
    assert_response :success
  end

end
