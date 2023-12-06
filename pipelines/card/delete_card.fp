pipeline "delete_card" {
  title       = "Delete Card"
  description = "Delete a card."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  step "http" "delete_card" {
    method = "delete"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${credential.trello[param.cred].api_key}&token=${credential.trello[param.cred].token}"
  }
}
