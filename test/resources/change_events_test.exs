defmodule Procore.Resources.ChangeEventsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.ChangeEvents

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             ChangeEvents.list(client, params)
  end

  test "create/1" do
    client = Procore.client()
    params = %{"project_id" => 1, "attachments" => [], "change_event" => %{}}

    assert %ResponseResult{reply: :ok, status_code: 201, parsed_body: %{}} =
             ChangeEvents.create(params)
  end
end
