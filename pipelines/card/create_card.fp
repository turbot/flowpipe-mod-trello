pipeline "create_card" {
  title       = "Create Card"
  description = "Create a new card."

  tags = {
    type = "featured"
  }

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "list_id" {
    type        = string
    description = "The ID of the list the card should be created in."
  }

  param "card_name" {
    type        = string
    description = "The name for the card."
    optional    = true
  }

  step "http" "create_card" {
    method = "post"
    url = join("&", concat(
      ["https://api.trello.com/1/cards?key=${credential.trello[param.cred].api_key}&token=${credential.trello[param.cred].token}"],
      [for name, value in param : "${local.create_card_query_params[name]}=${urlencode(value)}" if contains(keys(local.create_card_query_params), name) && value != null]
    ))
  }

  output "card" {
    description = "The new card details."
    value       = step.http.create_card.response_body
  }
}
