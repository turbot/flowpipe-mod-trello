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
  conn_param_description = "Name of Trello connection to use. If not provided, the default Trello connection will be used."
}
