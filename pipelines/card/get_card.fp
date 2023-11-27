pipeline "get_card" {
  title       = "Get Card"
  description = "Get a card by its ID."

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

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  step "http" "get_card" {
    method = "get"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.api_key}&token=${param.token}"
  }

  output "card" {
    description = "The card details."
    value       = step.http.get_card.response_body
  }
}
