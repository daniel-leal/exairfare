defmodule Exairfare.Users.UserTest do
  use ExUnit.Case

  alias Exairfare.Users.User

  describe "build/3" do
    test "when all params are valid, returns the user" do
      {:ok, %User{id: id}} =
        response =
        User.build(
          "Daniel",
          "daniel@banana.com",
          "12345678"
        )

      expected_response =
        {:ok, %User{id: id, cpf: "12345678", email: "daniel@banana.com", name: "Daniel"}}

      assert response == expected_response
    end

    test "when cpf is an integer, returns an error" do
      response =
        User.build(
          "Daniel",
          "daniel@banana.com",
          12_345_678
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
