pipeline "delete_card" {
  title       = "Delete Card"
  description = "Delete a card."

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  step "http" "delete_card" {
    method = "delete"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.conn.api_key}&token=${param.conn.token}"
  }
}
