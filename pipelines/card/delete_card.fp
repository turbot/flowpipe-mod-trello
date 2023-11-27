pipeline "delete_card" {
  title       = "Delete Card"
  description = "Delete a card."

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

  step "http" "delete_card" {
    method = "delete"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.api_key}&token=${param.token}"
  }
}
