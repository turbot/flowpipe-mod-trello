locals {
  create_card_query_params = {
    api_key   = "key"
    card_name = "name"
    list_id   = "idList"
    token     = "token"
  }

  update_card_query_params = {
    card_description = "desc"
    card_name        = "name"
    close            = "closed"
  }
}

# Common descriptions
locals {
  api_key_param_description = "The personal API key to authenticate to the Trello APIs."
  token_param_description   = "The personal token to authenticate to the Trello APIs."
}
