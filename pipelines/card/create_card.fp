pipeline "create_card" {
  title       = "Create Card"
  description = "Create a new card."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "list_id" {
    type        = string
    description = "The ID of the list the card should be created in."
  }

  param "card_name" {
    type        = string
    description = "The name for the card."
    optional    = true
  }

  step "http" "create_card" {
    method = "post"
    url = join("&", concat(
      ["https://api.trello.com/1/cards?key=${param.conn.api_key}&token=${param.conn.token}"],
      [for name, value in param : "${local.create_card_query_params[name]}=${urlencode(value)}" if contains(keys(local.create_card_query_params), name) && value != null]
    ))
  }

  output "card" {
    description = "The new card details."
    value       = step.http.create_card.response_body
  }
}
