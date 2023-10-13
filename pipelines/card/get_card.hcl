// usage: flowpipe pipeline run get_card --pipeline-arg card_id="CARD_ID"
pipeline "get_card" {
  title       = "Get a Card"
  description = "Get information about a Trello card."

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

  step "http" "get_card" {
    title  = "Get a Card"
    method = "get"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.api_key}&token=${param.token}"
  }

  output "card" {
    value       = step.http.get_card.response_body
    description = "The card object."
  }
}
