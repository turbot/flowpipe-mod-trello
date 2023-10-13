// usage: flowpipe pipeline run update_card --pipeline-arg card_id="CARD_ID" --pipeline-arg card_name="CARD_NAME"
pipeline "update_card" {
  title       = "Update a Card"
  description = "Update a card."

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

  param "card_name" {
    type        = string
    optional    = true
    description = "The new name for the card."
  }

  param "card_description" {
    type        = string
    optional    = true
    description = "The new description for the card."
  }

  param "close" {
    type        = string
    optional    = true
    description = "Whether the card should be archived (closed: true)."
  }

  step "http" "update_card" {
    title  = "Update a Card"
    method = "put"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.api_key}&token=${param.token}"
    // if contains(keys(local.create_card_query_params), name) && value != null
    request_body = jsonencode({ for name, value in param : local.update_card_query_params[name] => value if contains(keys(local.update_card_query_params), name) && value != null })
  }

  output "card" {
    value       = step.http.update_card.response_body
    description = "The card object."
  }
}
