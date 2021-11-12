defmodule Exairfare.Factory do
  use ExMachina

  alias Exairfare.Users.User

  def user_factory do
    %User{
      name: "Daniel",
      email: "daniel@banana.com",
      cpf: "12345678"
    }
  end
end
