defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  @products [
  %{id: "1", name: "god of war", price: 50},
  %{id: "2", name: "gta 6", price: 499},
  %{id: "3", name: "red dead", price: 499}
  ]
  def index(conn, _params) do
    conn
    |> assign(:products, @products)
    |> render(:index)
  end

  def show(conn, %{"id" => id}) do
    product = Enum.find(@products, fn product -> product.id == id end)

    IO.inspect(product)

    conn
    |> assign(:product, product)
    |> render(:show)
  end


end
