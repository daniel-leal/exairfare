defmodule Exairfare.Users.Agent do
  alias Exairfare.Users.User

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{id: id} = user) do
    Agent.update(__MODULE__, &update_state(&1, user, id))

    {:ok, id}
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_user(&1, uuid))

  defp get_user(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp update_state(state, %User{} = user, uuid), do: Map.put(state, uuid, user)
end
