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
    version        = "12"
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