defmodule Procore.Resources.CalendarEventsTest do
  use ExUnit.Case
  alias Procore.ResponseResult
  alias Procore.Resources.CalendarEvents

  test "list/1" do
    client = Procore.client()
    params = %{"project_id" => 1}

    assert %ResponseResult{reply: :ok, status_code: 200, parsed_body: []} =
             CalendarEvents.list(client, params)
  end
end
