defmodule Exairfare do
  alias Exairfare.Users.Agent, as: UserAgent

  def start_agents do
    UserAgent.start_link(%{})
  end
end
