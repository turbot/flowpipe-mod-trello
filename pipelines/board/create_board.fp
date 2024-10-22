pipeline "create_board" {
  title       = "Create Board"
  description = "Create a new board."

  param "conn" {
    type        = connection.trello
    description = local.conn_param_description
    default     = connection.trello.default
  }

  param "board_name" {
    type        = string
    description = "The new name for the board."
  }

  step "http" "create_board" {
    method = "post"
    url    = "https://api.trello.com/1/boards?name=${urlencode(param.board_name)}&key=${param.conn.api_key}&token=${param.conn.token}"
  }

  output "board" {
    description = "The new board details."
    value       = step.http.create_board.response_body
  }
}
