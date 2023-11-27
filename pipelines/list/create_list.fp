pipeline "create_list" {
  title       = "Create List"
  description = "Create a new list on a board."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "token" {
    type        = string
    description = local.token_param_description
    default     = var.token
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
    method = "post"
    url    = "https://api.trello.com/1/lists?name=${urlencode(param.list_name)}&idBoard=${urlencode(param.board_id)}&key=${param.api_key}&token=${param.token}"
  }

  output "list" {
    description = "The created list details."
    value       = step.http.create_list.response_body
  }
}
