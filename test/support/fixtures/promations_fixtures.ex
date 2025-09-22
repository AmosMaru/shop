defmodule Shop.PromationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Promations` context.
  """

  @doc """
  Generate a unique promation code.
  """
  def unique_promation_code, do: "some code#{System.unique_integer([:positive])}"

  @doc """
  Generate a promation.
  """
  def promation_fixture(attrs \\ %{}) do
    {:ok, promation} =
      attrs
      |> Enum.into(%{
        code: unique_promation_code(),
        expires_at: ~U[2025-09-21 18:52:00Z],
        name: "some name"
      })
      |> Shop.Promations.create_promation()

    promation
  end
end
