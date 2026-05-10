# install.packages(c("nanoparquet"))

require(nanoparquet) # referenciar

folder <- "./data"


# Base de dados
load("./data/agriculture_amazonas.rda")

rda_files <- list.files(folder, pattern = ".rda$")
load(paste0("./data/", rdaFiles[1]))

for (file in rda_files) {
  obj_names <- load(file.path(folder, file))
  
  for (obj_name in obj_names) {
    df <- get(obj_name)
    
    output_name <- paste0(folder, "/", obj_name, ".parquet")
    write_parquet(df, output_name)
  }
  rm(list = obj_names)
}
  


# write_parquet(agriculture_amazonas, "agriculture_amazonas.parquet")
