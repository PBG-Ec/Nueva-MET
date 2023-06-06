################################################################################
# Analisis GAD Nueva Formula de Equidad territorial  
################################################################################
### Loads 
pks <- c("tidyverse")
lapply(pks, require, character.only = TRUE)

### I. Construcción de la matriz de criterios #################################
db <- readRDS("BaseMaestra_NFET2.rds")
names(db) <- gsub("^o_","",names(db))

# Value vars Criterios #########################################################
# Monto A : M_tA
# % Frontera: pct_frontera
#  Área (miles Km2): Area_km2.2
# Poblacion 2021: pob_2021.2
# NBI 2022: nbi.2
# Ingreso fiscal 2022: ingr_p
# Gasto : gast_p 
# Poblacion rural ponderada Δ pob_rur 2010-2021 : pob_rur_pd1.2
# Pobl rur ponderada con frontera y Galapagos V_pob_rur_pd2.2
# Densidad de poblacion: V_Den <-  pob_rur_pd1.2 / Area_km2.2  
#ΔNBI canton 2010-2021 : nbi_dnbicant.2
db$nbi_nbiadj.2 <- (db$nbi_dnbicant.2 * db$nbi.2)^2 #ΔNBI canton 2010-2021
db$Insular <- as.numeric(grepl("GALAPAGOS",db$Provincia))
# mean ΔNBI canton 2019-2020-2021: nbi_dnbiycant.2 

# Variables Z ##################################################################
db$Z_pob <- 1
db$Z_Den <- 1+1*log(max(db$V_Den,na.rm = T)/db$V_Den)
db$Z_NBI <- ifelse(db$nbi_nbiadj.2<.01,.01,db$nbi_nbiadj.2)
db$Z_dNBI <- db$nbi_dnbiycant.2
db$Z_Esff <- 1
# Esf Administravtivo : Z_Esfa 
# Cumplimineto de  Metas  : Z_Cmet

# Variables M (k var= k*z): montos por 1 % #####################################
P_Pob=P_Den=P_NBI=P_dNBI=P_Esff=P_Esfa=P_Cmet=1
db$M_pob <- P_Pob *db$V_pob_rur_pd2.2 * db$Z_pob / sum(db$V_pob_rur_pd2.2 * db$Z_pob,na.rm = T)
db$M_Den <- P_Den * db$V_pob_rur_pd2.2 * db$Z_Den / sum(db$V_pob_rur_pd2.2 * db$Z_Den,na.rm = T)
db$M_NBI <- P_NBI * db$V_pob_rur_pd2.2 * db$Z_NBI / sum(db$V_pob_rur_pd2.2 * db$Z_NBI,na.rm = T)
db$M_dNBI <- P_dNBI * db$V_pob_rur_pd2.2 * db$Z_dNBI  / sum(db$V_pob_rur_pd2.2 * db$Z_dNBI,na.rm = T)
db$M_Esff <- P_Esff * db$V_pob_rur_pd2.2 * db$Z_Esff / sum(db$V_pob_rur_pd2.2 * db$Z_Esff,na.rm = T)
db$M_Esfa <- P_Esfa/2 * db$V_pob_rur_pd2.2 * db$Z_Esfa / sum(db$V_pob_rur_pd2.2 * db$Z_Esfa,na.rm = T) + 
  ifelse(db$Insular==1,1.916,1)* P_Esfa/2 / 825.58
db$M_Cmet <- P_Cmet * db$V_pob_rur_pd2.2 * db$Z_Cmet / sum(db$V_pob_rur_pd2.2 * db$Z_Cmet,na.rm = T)

# Replica formula actual 
TOTMONT <- 84.12
Pvec <- c(15,15,30,25,0,5,10)
db$Montotot <- 
  db$M_tA + 
  apply(db[,grep("M_[^t]",names(db))],1,function(x) sum(x*Pvec/100*TOTMONT))

# Nuevo Criterios ##############################################################
db$via_total_km<- rowSums(
  db[,c("via_ruta_local_km","via_ruta_primaria_km",
         "via_ruta_secundaria_km")],na.rm = T)
db$AreaAgricola <-  rowSums(db[,grep("agr_",names(db))],na.rm = T) 

db$U0 <- db$M_tA   # II.0. Monto A 
db$U1 <- db$M_pob  # II.1. Tamaño de la población
db$U2 <- db$M_Den  # II.2. Densidad de población
db$U3 <- db$M_NBI  # II.3. Pobreza
db$U4 <- db$M_dNBI # II.4. Logros en el mejoramiento de los niveles de vida
db$U5 <- db$M_Esff*0#II.5. Capacidad fiscal 
db$U6 <- db$M_Esfa #### II.6.	Esfuerzo administrativo
db$U7 <- db$M_Cmet#### II.7.	Cumplimiento de las metas del PDOT
# Criterios addicionales
# II.8.	Vialidad rural
db$U8 <- db$via_total_km /  sum(db$via_total_km,na.rm = T) 
# II.9.	Fomento Productivo
db$U9 <- db$AreaAgricola /  sum(db$AreaAgricola)
# II.10.	Servicios
db$Z10 = db$presupuesto_ejecutado_usd_SER / db$presupuesto_ejecutado_usd 
P_ser=1
db$U10 <- P_ser * db$V_pob_rur_pd2.2 * db$Z10 / 
  sum(db$V_pob_rur_pd2.2 * db$Z10,na.rm = T)
# II.11.Gestión Ambiental
db$U11 = db$AP_Areakm2 / sum(db$AP_Areakm2,na.rm = T) 
# II.12.	Genero
db$Z12 <- 1 - abs(db$Pct_mujeres - 0.5) 
P_gen <- 1
db$U12 <- P_gen * db$V_pob_rur_pd2.2 * db$Z12 / 
  sum(db$V_pob_rur_pd2.2 * db$Z12,na.rm = T)
