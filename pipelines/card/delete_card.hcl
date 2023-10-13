// usage: flowpipe pipeline run delete_card --pipeline-arg card_id="CARD_ID"
pipeline "delete_card" {
  title       = "Delete a Card"
  description = "Delete a card."

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

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  step "http" "delete_card" {
    title  = "Delete a Card"
    method = "delete"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.api_key}&token=${param.token}"
  }
}
