locals {
  create_card_query_params = {
    list_id   = "idList"
    card_name = "name"
    api_key   = "key"
    token     = "token"
  }
}

locals {
  update_card_query_params = {
    card_name        = "name"
    card_description = "desc"
    close            = "closed"
  }
}

# Common descriptions
locals {
  token_param_description   = "The personal token to authenticate to the Trello APIs."
  api_key_param_description = "The personal api key to authenticate to the Trello APIs."
}