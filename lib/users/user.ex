defmodule Exairfare.Users.User do
  @keys [:name, :email, :cpf]
  @enforce_keys @keys

  defstruct [:name, :email, :cpf]

  def build(name, email, cpf) when not is_integer(cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_name, _email, _cpf), do: {:error, "Invalid parameters"}
end
