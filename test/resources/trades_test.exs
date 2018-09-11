defmodule Procore.Resources.TradesTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.Trades

  test "list/1" do
    client = Procore.client()
    params = %{"company_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             Trades.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"company_id" => 1, "trade" => %{"name" => "Trade A"}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             Trades.create(client, params)
  end
end
