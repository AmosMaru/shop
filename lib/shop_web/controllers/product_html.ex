defmodule ShopWeb.ProductHTML do
  @moduledoc """
  This module contains pages rendered by ProductController.

  See the `product_html` directory for all templates available.
  """
  use ShopWeb, :html
  alias Shop.Product

  embed_templates "product_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <p>Game: {@product.names}!</p>
    <.link href={~p"/products/#{@product.slug}"}> {@product.names}</.link>
    """
  end
end
