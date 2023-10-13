// usage: flowpipe pipeline run create_board --pipeline-arg board_name="BOARD_NAME"
pipeline "create_board" {
  title       = "Create a Board"
  description = "Create a new board."

  param "api_key" {
    type        = string
    default     = var.api_key
    description = "The Trello API key."
  }

  param "token" {
    type        = string
    default     = var.token
    description = "The Trello token."
  }

  param "board_name" {
    type        = string
    description = "The new name for the board."
  }

  step "http" "create_board" {
    title  = "Create a Board"
    method = "post"
    url    = "https://api.trello.com/1/boards?name=${urlencode(param.board_name)}&key=${param.api_key}&token=${param.token}"
  }

  output "board" {
    value       = step.http.create_board.response_body
    description = "The board object."
  }
}
