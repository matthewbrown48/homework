defmodule ApiTest do
    #Import helpers
    #import helper_functions
    use Tesla
    
    use ExUnit.Case

    plug Tesla.Middleware.BaseUrl, "https://api.github.com"
     test "ClearEntryAd" do
      assert {:ok, env} = get("https://reqres.in/api/users?page=2")
      assert env.status == 200
      assert env.body == "hello"
      end
  end