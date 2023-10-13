// usage: flowpipe pipeline run create_list --pipeline-arg board_id="BOARD_ID" --pipeline-arg list_name="LIST_NAME"
pipeline "create_list" {
  title       = "Create a List"
  description = "Create a new list."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = "The Trello API key."
  }

  param "token" {
    type        = string
    default     = var.token
    description = "The Trello token."
  }

  param "board_id" {
    type        = string
    description = "The long ID of the board the list should be created on."
  }

  param "list_name" {
    type        = string
    description = "Name for the list."
  }

  step "http" "create_list" {
    title  = "Create a List"
    method = "post"
    url    = "https://api.trello.com/1/lists?name=${urlencode(param.list_name)}&idBoard=${urlencode(param.board_id)}&key=${param.api_key}&token=${param.token}"
  }

  output "list" {
    value       = step.http.create_list.response_body
    description = "The list object."
  }
}
