defmodule ShopWeb.PromationHTML do
  use ShopWeb, :html

  embed_templates "promation_html/*"

  @doc """
  Renders a promation form.

  The form is defined in the template at
  promation_html/promation_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def promation_form(assigns)
end
