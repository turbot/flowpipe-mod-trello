pipeline "get_list" {
  title       = "Get List"
  description = "Get information about a list."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  param "list_id" {
    type        = string
    description = "The ID of the list."
  }

  step "http" "get_list" {
    method = "get"
    url    = "https://api.trello.com/1/lists/${param.list_id}?key=${credential.trello[param.cred].api_key}&token=${credential.trello[param.cred].token}"
  }

  output "list" {
    description = "The list details."
    value       = step.http.get_list.response_body
  }
}
