resource = {
  aksrg = "eastus"
}

azkuberser = {
  aksnewser = {
    rg_name = "aksrg"
    dns     = "aksprefix"
  }
}

postgresqlser = {
  postgresaxion = {
    rg_name        = "aksrg"
    location       = "centralindia"
    version        = "16"
    admin_login    = "postgres"
    admin_password = "admin@123"
    storage        = 32768
  }
}

postgresdb = {
  axion-db = {
    server_name = "postgresaxion"
  }
}