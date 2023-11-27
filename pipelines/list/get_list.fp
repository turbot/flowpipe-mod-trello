pipeline "get_list" {
  title       = "Get List"
  description = "Get information about a list."

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

  param "list_id" {
    type        = string
    description = "The ID of the list."
  }

  step "http" "get_list" {
    method = "get"
    url    = "https://api.trello.com/1/lists/${param.list_id}?key=${param.api_key}&token=${param.token}"
  }

  output "list" {
    description = "The list details."
    value       = step.http.get_list.response_body
  }
}
