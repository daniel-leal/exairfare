defmodule Exairfare.Bookings.Agent do
  use Agent

  alias Exairfare.Bookings.Booking

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    Agent.update(__MODULE__, &update_state(&1, booking))
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_booking(&1, uuid))

  def get(%NaiveDateTime{} = from_date, %NaiveDateTime{} = to_date) do
    bookings =
      list_all_bookings()
      |> Enum.filter(fn {_booking_id, %Booking{complete_date: complete_date}} ->
        from = NaiveDateTime.compare(complete_date, from_date)
        to = NaiveDateTime.compare(complete_date, to_date)

        (from == :eq or from == :gt) and (to == :eq or to == :lt)
      end)
      |> Enum.map(fn {_booking_id, %Booking{} = booking} -> booking end)

    {:ok, bookings}
  end

  def list_all_bookings, do: Agent.get(__MODULE__, & &1)

  defp get_booking(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end

  defp update_state(state, %Booking{id: id} = booking), do: Map.put(state, id, booking)
end
