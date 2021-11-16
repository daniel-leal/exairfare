defmodule Exairfare.Bookings.AgentTest do
  use ExUnit.Case

  alias Exairfare.Bookings.Agent, as: BookingAgent

  import Exairfare.Factory

  describe "save/1" do
    test "saves the booking" do
      booking = build(:booking)

      BookingAgent.start_link(%{})

      assert {:ok, _uuid} = BookingAgent.save(booking)
    end
  end

  describe "get/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "when the booking is found, returns the booking" do
      booking = build(:booking)

      {:ok, uuid} = BookingAgent.save(booking)

      response = BookingAgent.get(uuid)

      expected_response = {:ok, booking}

      assert response == expected_response
    end

    test "when the booking is not found, returns an error" do
      response = BookingAgent.get("0000000000")

      expected_response = {:error, "Booking not found"}

      assert response == expected_response
    end
  end
end
