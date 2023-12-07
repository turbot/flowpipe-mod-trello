pipeline "get_card" {
  title       = "Get Card"
  description = "Get a card by its ID."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = "default"
  }

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  step "http" "get_card" {
    method = "get"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${credential.trello[param.cred].api_key}&token=${credential.trello[param.cred].token}"
  }

  output "card" {
    description = "The card details."
    value       = step.http.get_card.response_body
  }
}
