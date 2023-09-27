bioc_pkgs<-c(
'DropletUtils'
)

requireNamespace("BiocManager")
BiocManager::install(bioc_pkgs,ask=F)
