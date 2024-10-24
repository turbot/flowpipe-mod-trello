mod "trello" {
  title         = "Trello"
  description   = "Run pipelines to supercharge your Trello workflows using Flowpipe."
  color         = "#217EF9"
  documentation = file("./README.md")
  icon          = "/images/mods/turbot/trello.svg"
  categories    = ["library", "productivity"]

  opengraph {
    title       = "Trello Mod for Flowpipe"
    description = "Run pipelines to supercharge your Trello workflows using Flowpipe."
    image       = "/images/mods/turbot/trello-social-graphic.png"
  }

  require {
    flowpipe {
      min_version = "1.0.0"
    }
  }
}
