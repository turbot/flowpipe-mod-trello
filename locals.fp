locals {
  create_card_query_params = {
    card_name = "name"
    list_id   = "idList"
  }

  update_card_query_params = {
    card_description = "desc"
    card_name        = "name"
    close            = "closed"
  }
}

# Common descriptions
locals {
  cred_param_description = "Name for credentials to use. If not provided, the default credentials will be used."
}
