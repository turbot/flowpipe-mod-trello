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
