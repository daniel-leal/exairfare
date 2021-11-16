defmodule Exairfare do
  alias Exairfare.Users.Agent, as: UserAgent
  alias Exairfare.Bookings.Agent, as: BookingAgent

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end
end
