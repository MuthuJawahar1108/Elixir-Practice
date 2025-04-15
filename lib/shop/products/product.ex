defmodule Shop.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :console, :slug]}
  schema "products" do
    field :name, :string
    field :console, Ecto.Enum, values: [:pc, :nintendo, :playstation, :xbox]
    field :slug, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do  #Validating the data before inserting it into the database
    product
    |> cast(attrs, [:name, :console])
    |> validate_required([:name, :console])
    |> validate_length(:name, min: 3 )
    |> format_name()
    |> generate_slug()
    |> unique_constraint(:slug)
  end

  defp format_name(changeset) do
    name =
      get_field(changeset, :name)
      |> String.trim()

    put_change(changeset, :name, name)
  end

  defp generate_slug(changeset) do
    slug =
      get_field(changeset, :name)
      |> String.downcase()
      |> String.replace(" ", "-")

    put_change(changeset, :slug, slug)
  end

end
