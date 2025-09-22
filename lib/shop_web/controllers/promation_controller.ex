defmodule ShopWeb.PromationController do
  use ShopWeb, :controller

  alias Shop.Promations
  alias Shop.Promations.Promation

  def index(conn, _params) do
    pronations = Promations.list_pronations()
    render(conn, :index, pronations: pronations)
  end

  def new(conn, _params) do
    changeset = Promations.change_promation(%Promation{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"promation" => promation_params}) do
    case Promations.create_promation(promation_params) do
      {:ok, promation} ->
        conn
        |> put_flash(:info, "Promation created successfully.")
        |> redirect(to: ~p"/pronations/#{promation}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    promation = Promations.get_promation!(id)
    render(conn, :show, promation: promation)
  end

  def edit(conn, %{"id" => id}) do
    promation = Promations.get_promation!(id)
    changeset = Promations.change_promation(promation)
    render(conn, :edit, promation: promation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "promation" => promation_params}) do
    promation = Promations.get_promation!(id)

    case Promations.update_promation(promation, promation_params) do
      {:ok, promation} ->
        conn
        |> put_flash(:info, "Promation updated successfully.")
        |> redirect(to: ~p"/pronations/#{promation}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, promation: promation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    promation = Promations.get_promation!(id)
    {:ok, _promation} = Promations.delete_promation(promation)

    conn
    |> put_flash(:info, "Promation deleted successfully.")
    |> redirect(to: ~p"/pronations")
  end
end
