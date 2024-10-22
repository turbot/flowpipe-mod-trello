pipeline "get_list" {
  title       = "Get List"
  description = "Get information about a list."

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "list_id" {
    type        = string
    description = "The ID of the list."
  }

  step "http" "get_list" {
    method = "get"
    url    = "https://api.trello.com/1/lists/${param.list_id}?key=${param.conn.api_key}&token=${param.conn.token}"
  }

  output "list" {
    description = "The list details."
    value       = step.http.get_list.response_body
  }
}
