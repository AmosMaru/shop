defmodule Shop.Promations do
  @moduledoc """
  The Promations context.
  """

  import Ecto.Query, warn: false
  alias Shop.Repo

  alias Shop.Promations.Promation

  @doc """
  Returns the list of pronations.

  ## Examples

      iex> list_pronations()
      [%Promation{}, ...]

  """
  def list_pronations do
    Repo.all(Promation)
  end

  @doc """
  Gets a single promation.

  Raises `Ecto.NoResultsError` if the Promation does not exist.

  ## Examples

      iex> get_promation!(123)
      %Promation{}

      iex> get_promation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_promation!(id), do: Repo.get!(Promation, id)

  @doc """
  Creates a promation.

  ## Examples

      iex> create_promation(%{field: value})
      {:ok, %Promation{}}

      iex> create_promation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_promation(attrs) do
    %Promation{}
    |> Promation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a promation.

  ## Examples

      iex> update_promation(promation, %{field: new_value})
      {:ok, %Promation{}}

      iex> update_promation(promation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_promation(%Promation{} = promation, attrs) do
    promation
    |> Promation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a promation.

  ## Examples

      iex> delete_promation(promation)
      {:ok, %Promation{}}

      iex> delete_promation(promation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_promation(%Promation{} = promation) do
    Repo.delete(promation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking promation changes.

  ## Examples

      iex> change_promation(promation)
      %Ecto.Changeset{data: %Promation{}}

  """
  def change_promation(%Promation{} = promation, attrs \\ %{}) do
    Promation.changeset(promation, attrs)
  end
end
