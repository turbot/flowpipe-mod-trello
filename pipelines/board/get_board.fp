pipeline "get_board" {
  title       = "Get Board"
  description = "Request a single board."

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

  param "board_id" {
    type        = string
    description = "The ID of the board."
  }

  step "http" "get_board" {
    method = "get"
    url    = "https://api.trello.com/1/boards/${param.board_id}?key=${param.api_key}&token=${param.token}"
  }

  output "board" {
    description = "The board details."
    value       = step.http.get_board.response_body
  }
}
