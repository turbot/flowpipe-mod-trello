pipeline "get_board" {
  title       = "Get Board"
  description = "Request a single board."

  tags = {
    recommended = "true"
  }

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "board_id" {
    type        = string
    description = "The ID of the board."
  }

  step "http" "get_board" {
    method = "get"
    url    = "https://api.trello.com/1/boards/${param.board_id}?key=${param.conn.api_key}&token=${param.conn.token}"
  }

  output "board" {
    description = "The board details."
    value       = step.http.get_board.response_body
  }
}
