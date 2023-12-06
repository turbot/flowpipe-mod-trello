pipeline "get_board" {
  title       = "Get Board"
  description = "Request a single board."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  param "board_id" {
    type        = string
    description = "The ID of the board."
  }

  step "http" "get_board" {
    method = "get"
    url    = "https://api.trello.com/1/boards/${param.board_id}?key=${credential.trello[param.cred].api_key}&token=${credential.trello[param.cred].token}"
  }

  output "board" {
    description = "The board details."
    value       = step.http.get_board.response_body
  }
}
