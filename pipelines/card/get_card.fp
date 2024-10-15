pipeline "get_card" {
  title       = "Get Card"
  description = "Get a card by its ID."

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  step "http" "get_card" {
    method = "get"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.conn.api_key}&token=${param.conn.token}"
  }

  output "card" {
    description = "The card details."
    value       = step.http.get_card.response_body
  }
}
