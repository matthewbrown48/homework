defmodule MyClient do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://reqres.in/"
end

defmodule ApiTest do
    use ExUnit.Case
    #test to create a user, and confirm that the user was created through the response
    test "CreateUser" do
      #User being created can be changed here
      str_request = "{\"name\": \"John\",\"job\": \"SDET\"}" #
      assert {:ok, env} = MyClient.post("/api/users", str_request)
      #Confirm that the request was successful
      assert env.status == 201
      #response = Jason.decode(env.body)
      end
  end