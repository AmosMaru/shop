defmodule ShopWeb.ProductHTML do
  @moduledoc """
  This module contains pages rendered by ProductController.

  See the `product_html` directory for all templates available.
  """
  use ShopWeb, :html

  embed_templates "product_html/*"


  attr :name, :string, required: true

  def product(assigns) do
    ~H"""
    <p>Game: <%= assigns.name %>!</p>
    """
  end
end
