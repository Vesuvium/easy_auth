defmodule EasyAuth do
  @moduledoc """
  A Plug that implements HTTP Basic authentication.
  """
  alias Plug.Crypto
  alias Plug.Conn

  def init(options) do
    options
  end

  @doc """
  Extracts an header when present, or return nil
  """
  defp extract_header(header) do
    if Enum.count(header) > 0 do
      Enum.at(header, 0)
    end
  end

  @doc """
  Get the authorization header value
  """
  defp authorization_header(conn) do
    conn
    |> Conn.get_req_header("authorization")
    |> extract_header()
  end

  @doc """
  Creates the comparison token
  """
  defp get_token(options) do
    string =
      (options[:username] <> ":" <> options[:password])
      |> Base.encode64()

    "Basic " <> string
  end

  @doc """
  Finds out whether auth and token match
  """
  defp tokens_match(authorization, token) do
    if Crypto.secure_compare(authorization, token) do
      true
    end
  end

  @doc """
  Produces a 401 response
  """
  defp unauthorised(conn, options) do
    conn
    |> Conn.put_resp_header("www-authenticate", "Basic realm=\"#{options[:realm]}\"")
    |> Conn.put_resp_content_type("text/plain")
    |> Conn.send_resp(401, "401 Unauthorized")
    |> Conn.halt()
  end

  @doc """
  Verifies the auth header is correct
  """
  def verify_auth(conn, options) do
    token = get_token(options)
    authorization = authorization_header(conn)

    if authorization do
      if tokens_match(authorization, token) do
        true
      end
    end
  end

  def call(conn, options) do
    if verify_auth(conn, options) do
      conn
    else
      unauthorised(conn, options)
    end
  end
end
