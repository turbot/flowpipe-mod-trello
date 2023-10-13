// usage: flowpipe pipeline run create_card --pipeline-arg list_id="LIST_ID" --pipeline-arg card_name="CARD_NAME"
pipeline "create_card" {
  title       = "Create a Card"
  description = "Create a new card."

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
    description = "The ID of the list the card should be created in."
  }

  param "card_name" {
    type        = string
    optional    = true
    description = "The name for the card."
  }

  step "http" "create_card" {
    title  = "Create a Card"
    method = "post"
    url = join("&", concat(["https://api.trello.com/1/cards?"],
    [for name, value in param : "${local.create_card_query_params[name]}=${urlencode(value)}" if contains(keys(local.create_card_query_params), name) && value != null]))
  }

  output " card " {
    value       = step.http.create_card.response_body
    description = " The card object."
  }
}
