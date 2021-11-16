defmodule Exairfare.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exairfare.Bookings.Agent, as: BookingAgent
  alias Exairfare.Bookings.CreateOrUpdate

  describe "call/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the booking" do
      params = %{
        complete_date: ~N[2001-05-07 01:46:20],
        local_destination: "ilha das bananas",
        local_origin: "Brasilia",
        user_id: "12345678900"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "Booking created or updated successfully"}

      assert response == expected_response
    end
  end
end
