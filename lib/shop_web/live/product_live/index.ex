defmodule ShopWeb.ProductLive.Index do

  use ShopWeb, :live_view
  alias Shop.Products

  def mount(_params, _session, socket) do

    products = Products.list_products()
    likes =
      products
      |> Enum.map(&{&1.id, 0})
      |> Map.new()


    socket =
      socket
      |> assign(:products, products)
      |> assign(:likes, likes)

    {:ok, socket}
  end


  def handle_event("like",  %{"id" => id}, socket) do


    id = String.to_integer(id)
    likes = Map.put(socket.assigns.likes, id, socket.assigns.likes[id] + 1 )

    socket =
      socket
      |> assign(:likes, likes)

    {:noreply, socket}
  end



  def handle_event("dislike", %{"id" => id} , socket) do

    id = String.to_integer(id)
    likes = Map.put(socket.assigns.likes, id, socket.assigns.likes[id] - 1 )

    socket =
      socket
      |> assign(:likes, likes)

    {:noreply, socket}
  end


  def render(assigns) do
    ~H"""
      <div :for={product <- @products}>
        <p>{product.name} - Likes: {@likes[product.id]}</p>
        <.icon class="size-5 cursor-pointer" name="hero-hand-thumb-up-mini" phx-click="like" phx-value-id={product.id}/>
        <.icon class="size-5 cursor-pointer" name="hero-hand-thumb-down-mini" phx-click="dislike" phx-value-id={product.id}/>
      </div>

    """
  end

end
