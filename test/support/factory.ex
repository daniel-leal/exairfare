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
      id: UUID.uuid4(),
      user_id: "78945612300",
      complete_date: ~N[2021-11-16 16:00:00],
      local_origin: "Belém",
      local_destination: "Brasília"
    }
  end
end
