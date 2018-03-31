defmodule Procore.Resources.ProjectChecklists do
  @moduledoc """
  Available actions for the Checklist Template resource.
  """
  alias Procore.ErrorResult
  alias Procore.Request
  alias Procore.ResponseResult

  @doc """
  Lists Inspection Checklists in a specified Project.
  """
  @spec list(%{(project_id :: String.t()) => pos_integer}) :: %ResponseResult{} | %ErrorResult{}
  def list(%{"project_id" => project_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/lists")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Returns Project Checklist.
  """
  @spec show(%{
          (project_id :: String.t()) => pos_integer,
          (checklist_id :: String.t()) => pos_integer
        }) :: %ResponseResult{} | %ErrorResult{}
  def show(%{"project_id" => project_id, "checklist_id" => checklist_id}) do
    %Request{}
    |> Request.insert_request_type(:get)
    |> Request.insert_endpoint("/vapid/checklist/lists/#{checklist_id}")
    |> Request.insert_query_params(%{"project_id" => project_id})
    |> Procore.send_request()
  end

  @doc """
  Creates Project Checklist.
  """
  @spec create(%{
          (project_id :: String.t()) => pos_integer,
          (template_id :: String.t()) => pos_integer,
          (list :: String.t()) => map()
        }) :: %ResponseResult{} | %ErrorResult{}
  def create(%{"project_id" => project_id, "template_id" => template_id, "list" => list}) do
    %Request{}
    |> Request.insert_request_type(:post)
    |> Request.insert_endpoint("/vapid/checklist/lists")
    |> Request.insert_query_params(%{
      "project_id" => project_id,
      "template_id" => template_id,
      "list" => list,
      "attachments" => list["attachments"]
    })
    |> Procore.send_request()
  end
end