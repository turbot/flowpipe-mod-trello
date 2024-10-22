pipeline "update_card" {
  title       = "Update Card"
  description = "Update a card."

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "card_id" {
    type        = string
    description = "The ID of the card."
  }

  param "card_name" {
    type        = string
    description = "The new name for the card."
    optional    = true
  }

  param "card_description" {
    type        = string
    description = "The new description for the card."
    optional    = true
  }

  param "close" {
    type        = string
    description = "Whether the card should be archived (closed: true)."
    optional    = true
  }

  step "http" "update_card" {
    method = "put"
    url    = "https://api.trello.com/1/cards/${param.card_id}?key=${param.conn.api_key}&token=${param.conn.token}"

    request_body = jsonencode({ for name, value in param : local.update_card_query_params[name] => value if contains(keys(local.update_card_query_params), name) && value != null })
  }

  output "card" {
    description = "The updated card details."
    value       = step.http.update_card.response_body
  }
}
