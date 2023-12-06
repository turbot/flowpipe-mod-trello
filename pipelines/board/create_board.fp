pipeline "create_board" {
  title       = "Create Board"
  description = "Create a new board."

  param "cred" {
    type        = string
    description = local.cred_param_description
    default     = var.default_cred
  }

  param "board_name" {
    type        = string
    description = "The new name for the board."
  }

  step "http" "create_board" {
    method = "post"
    url    = "https://api.trello.com/1/boards?name=${urlencode(param.board_name)}&key=${credential.trello[param.cred].api_key}&token=${credential.trello[param.cred].token}"
  }

  output "board" {
    description = "The new board details."
    value       = step.http.create_board.response_body
  }
}
