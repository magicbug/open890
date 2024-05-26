defmodule Open890Web.RadioConnectionController do
  use Open890Web, :controller

  alias Open890.RadioConnection
  alias Open890.ConnectionCommands

  plug :assign_bg_theme

  def new(conn, _params) do
    conn
    |> assign(:radio_connection, %RadioConnection{})
    |> render("new.html")
  end

  def create(conn, %{"radio_connection" => radio_connection_params}) do
    radio_connection_params
    |> RadioConnection.create()
    |> case do
      {:ok, %RadioConnection{auto_start: true} = connection} ->
        Logger.info("Connection is auto_start, starting")
        RadioConnection.start(connection)

      other ->
        Logger.info("Connection is not auto-start, create result: #{inspect(other)}")
    end

    conn |> redirect(to: connections_path())
  end

  def edit(conn, %{"id" => id} = _params) do
    RadioConnection.find(id)
    |> case do
      {:ok, radio_connection} ->
        conn
        |> assign(:radio_connection, radio_connection)
        |> render("edit.html")

      _ ->
        conn
        |> redirect(to: connections_path())
    end
  end

  def update(conn, %{"id" => id, "radio_connection" => radio_params}) do
    id
    |> RadioConnection.find()
    |> case do
      {:ok, radio_connection} ->
        radio_connection
        |> RadioConnection.update_connection(radio_params)
        |> case do
          :ok ->
            conn |> redirect(to: connections_path())

          {:error, reason} ->
            Logger.debug("Could not update connection: #{inspect(reason)}")
            conn |> render("edit.html")
        end

      _ ->
        Logger.warn("Could not find connection: #{id}")
        conn |> redirect(to: connections_path())
    end
  end

  def wake(conn, %{"id" => id} = _params) do
    case RadioConnection.find(id) do
      {:ok, conn} ->
        ConnectionCommands.wake(conn)

      _ ->
        Logger.warn("Could not find connection: #{inspect(id)}")
    end

    conn
    |> redirect(to: Routes.radio_connection_path(conn, :index))
  end

  defp assign_bg_theme(conn, _options) do
    conn |> assign(:bg_theme, "light")
  end

  defp connections_path do
    ~p"/connections-live"
  end
end
