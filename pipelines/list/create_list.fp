pipeline "create_list" {
  title       = "Create List"
  description = "Create a new list on a board."

  tags = {
    type = "featured"
  }

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
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
    url    = "https://api.trello.com/1/lists?name=${urlencode(param.list_name)}&idBoard=${urlencode(param.board_id)}&key=${param.conn.api_key}&token=${param.conn.token}"
  }

  output "list" {
    description = "The created list details."
    value       = step.http.create_list.response_body
  }
}
