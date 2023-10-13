// usage: flowpipe pipeline run get_board --pipeline-arg board_id="BOARD_ID"
pipeline "get_board" {
  title       = "Get a Board"
  description = "Request a single board."

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

  param "board_id" {
    type        = string
    description = "The ID of the board."
  }

  step "http" "get_board" {
    title  = "Get a Board"
    method = "get"
    url    = "https://api.trello.com/1/boards/${param.board_id}?key=${param.api_key}&token=${param.token}"
  }

  output "board" {
    value       = step.http.get_board.response_body
    description = "The board object."
  }
}
