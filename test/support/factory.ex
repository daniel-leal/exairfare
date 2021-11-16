defmodule Exairfare.Factory do
  use ExMachina

  alias Exairfare.Users.User
  alias Exairfare.Bookings.Booking

  def user_factory do
    %User{
      id: UUID.uuid4(),
      name: "Daniel",
      email: "daniel@banana.com",
      cpf: "12345678"
    }
  end

  def booking_factory do
    %Booking{
      id: "939fde23-294b-46f1-9692-a7a6007f8557",
      user_id: "70831e44-5820-4b4c-aae1-87b079a2882f",
      complete_date: ~N[2020-09-01 12:00:00],
      local_origin: "São Leopoldo",
      local_destination: "Porto Alegre"
    }
  end
end
