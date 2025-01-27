#' Define RODBC connection to Oracle
#' 
#' @description Creates the RODBC connection to Oracle needed to pull SQL 
#' queries from RACE database. Make sure you are connected to the VPN before 
#' running the function. 
#' 
#' @param schema A registered data source name. To be used as the `dsn` argument in `RODBC::odbcConnect()`
#' @return channel of class "RODBC". See `?RODBC::odbcConnect()` for more detail
#' @export
#' 

get_connected <- function(schema = "AFSC") {
  
   # check if database name is stored in keyring, if not request user/pwd
  if(!(db %in% keyring::key_list()[,1])) {
    username <- getPass::getPass(msg = "Enter your AFSC Oracle Database Username: ")
    password <- getPass::getPass(msg = "Enter your AFSC Oracle Database Password: ")
  } else {
    username <- keyring::key_list(db)$username
    password <-  keyring::key_get(db, keyring::key_list(db)$username)
  }
  
  suppressWarnings(channel <- RODBC::odbcConnect(dsn = paste(schema), 
                                                 uid = paste(username), 
                                                 pwd = paste(password), 
                                                 believeNRows = FALSE))
  if (channel == -1) {
    stop("Unable to connect. Username or password may be incorrect. Check that you are connected to the network (e.g., VPN). Please re-enter.\n\n")
    return(invisible())
  }
  
  if (class(channel) == "RODBC") {
    cat("Successfully connected to Oracle.\n\n")
    return(channel)
  }
  
}
