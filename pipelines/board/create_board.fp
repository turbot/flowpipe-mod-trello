pipeline "create_board" {
  title       = "Create Board"
  description = "Create a new board."

  param "api_key" {
    type        = string
    description = local.api_key_param_description
    default     = var.api_key
  }

  param "token" {
    type        = string
    description = local.token_param_description
    default     = var.token
  }

  param "board_name" {
    type        = string
    description = "The new name for the board."
  }

  step "http" "create_board" {
    method = "post"
    url    = "https://api.trello.com/1/boards?name=${urlencode(param.board_name)}&key=${param.api_key}&token=${param.token}"
  }

  output "board" {
    description = "The new board details."
    value       = step.http.create_board.response_body
  }
}
