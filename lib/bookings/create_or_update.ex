defmodule Exairfare.Bookings.CreateOrUpdate do
  alias Exairfare.Bookings
  alias Bookings.Agent, as: BookingAgent
  alias Bookings.Booking

  def call(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }) do
    complete_date
    |> Booking.build(local_origin, local_destination, user_id)
    |> save_booking()
  end

  defp save_booking({:ok, %Booking{} = booking}) do
    BookingAgent.save(booking)

    {:ok, "Booking created or updated successfully"}
  end
end
