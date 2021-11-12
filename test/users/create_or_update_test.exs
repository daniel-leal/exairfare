defmodule Exairfare.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exairfare.Users.Agent, as: UserAgent
  alias Exairfare.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Daniel",
        email: "daniel@email.com",
        cpf: "78945612300"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Daniel",
        email: "daniel@email.com",
        cpf: 78_945_612_300
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
