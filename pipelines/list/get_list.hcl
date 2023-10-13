// usage: flowpipe pipeline run get_list --pipeline-arg list_id = "LIST_ID"
pipeline "get_list" {
  title       = "Get a List"
  description = "Request a single list."

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

  param "list_id" {
    type        = string
    description = "The ID of the list."
  }

  step "http" "get_list" {
    title  = "Get a List"
    method = "get"
    url    = "https://api.trello.com/1/lists/${param.list_id}?key=${param.api_key}&token=${param.token}"
  }

  output "list" {
    value       = jsondecode(step.http.get_list.response_body)
    description = "The list object."
  }
}
