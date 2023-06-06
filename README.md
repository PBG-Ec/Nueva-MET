# Repositorio de datos del nuevo modelo de equidad territorial
Simulación de modelo de equidad territorial

En esta página se encuetran los datos permitiendo el calculo de la MET para el año 2022, presentado en la página https://pbgec.shinyapps.io/shapp/. 
Tambien se incluye la documentación pública referente a los cálculos de presupuestos a nivel de GADs. 

## Universo

Según el marco de División Político Administrativo (DPA) del país, en 2022 existían 1042 parroquias que cubren la totalidad del país (INEC). Por razones de actualización de ciertas fuentes de datos, se utilizó igualmente el marco de DPA del año 2010, cuando las fuentes de información están basadas en este marco.

Sin embargo, el Catálogo entidades públicas emitido por el Ministerio de Economía y Finanzas repertorio al 31 de diciembre 2022, 821 Gobiernos Autónomos Descentralizados Parroquiales (GADPr). Se empleará esta referencia como base de la población de GADPr. A cada una de estas parroquias se asocia un identificador por DPA y un registro único de contribuyente (RUC). Cada criterio construido posteriormente se relaciona en base a estos identificadores para realizar la integración de las bases de datos.

## Identificación de Fuentes y de información

Para cada criterio se identificó la referencia de bases de datos estadísticas más actualizadas disponibles. En algunos casos, se elaboró un programa de recuperación de los datos en línea. Se describe a continuación la fuente identificada para cada criterio:

1.	Tamaño de la población. Hace referencia a las proyecciones de población a nivel parroquial publicadas por el INEC, usando modelos demográficos de componentes con ecuaciones compensadoras. Los resultados disponibles se presentan a nivel de DPA del año 2010 (INEC).

2.	Densidad de población. La densidad de la población se estimó en base a la extensión geográfica de cada parroquia de la DPA del año 2022 (INEC).

3.	Pobreza. Se emplea las proyecciones NBI del INEC para 2021. Sin embargo, la base de datos más precisa y actualizada a nivel de parroquia hace referencia al informe “El Reporte de Pobreza 2006 – 2014” publicado en 2015. Emplea metodologías de estimación de pequeñas áreas de pobreza por consumo.

4.	Logros en el mejoramiento de los niveles de vida. Se emplea las proyecciones NBI del INEC.

5.	Capacidad fiscal. No se aplicó este criterio al no tener peso en los presupuestos parroquiales.

6.	Esfuerzo administrativo. Se estimo el esfuerzo administrativo en base a la ejecución de presupuestos entre presupuestos planificados y ejecutados reportados en los informes de rendición de cuentas publicados por el Consejo de Participación Ciudadana y Control Social (CPCCS).

7.	Cumplimiento de las metas del PDOT. Se estimo el cumplimiento de metas del PDOT como promedio del avance de los proyectos reportados en los informes de rendición de cuentas publicados por el Consejo de Participación Ciudadana y Control Social.

8.	Vialidad rural. Se estimo dentro de cada limite territorial de las parroquias, el total de kilómetros de vías atravesando el territorio. Se basa en la información geográfica publicada por el Instituto Geográfico Militar del año 2015.

9.	Fomento Productivo. La necesidad de fomento productivo se estimó en base a la suma de áreas productivas reportadas en la información geográfica de sistemas productivos a través del Sistema Nacional de Información de Tierras Rurales e Infraestructura Tecnológica (programa SIGTIERRAS) (MAGAP 2020).

10.	Servicios. El criterio de servicios se estimó en base a los rubros de gastos clasificados como inversión en proyectos culturales, turísticos, en mantenimiento de la infraestructura de agua e irrigación, y maquinaría publicados en los informes de rendición de cuenta del CPCCS.

11.	Gestión Ambiental. Este componente se calculó sumando las áreas protegidas presentes en cada territorio parroquial dividido por la suma nacional de áreas protegidas del país. Se incluyeron como área protegida la información geográfica publicada por el Ministerio del Ambiente, Agua y Transición Ecológica. Estas que cubren áreas del Sistema Nacional de Área Protegida SNAP, Bosques y Vegetación Protectora, Patrimonio Forestal del Estado, Reservas de Biósfera, Áreas de conservación individual, Humedal Ramsar, Áreas de Protección Hídrica, Zona Intangible Tagaeri - Taromenane, Zona de amortiguamiento.

12.	Genero. El componente de genero se base en el resultado de las últimas elecciones de dignidades parroquiales, midiendo el porcentaje de mujeres elegidas en los territorios parroquiales. Se emplearon la base de datos de Consejo Nacional Electoral como fuente oficial de información.

## Fuentes de datos empleadas 

|     CRITERIO                                           |     ESTADISTICO                                                             |     FUENTE                                                                                                                |     Año     |     Resolución                          |     Fuente   en línea                                                                                                                   |
|--------------------------------------------------------|-----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|-------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
|     1.Violencia   de Género                            |     Porcentaje   de mujeres que han sufrido violencia a largo de su vida    |     Encuesta   Nacional sobre Relaciones Familiares y Violencia de Género contra las   Mujeres- ENVIGMU                   |     2011    |     Regional,   Ciudades principales    |     https://anda.inec.gob.ec/anda/index.php/catalog/919                                                                                 |
|     2.Tamaño   de la población                         |     Población                                                               |     INEC-   proyección de población (PP)                                                                                  |     2021    |     Parroquias                          |     https://www.ecuadorencifras.gob.ec/proyecciones-poblacionales/                                                                      |
|     3.Densidad   de Población                          |     Población/Área                                                          |     INEC   – PP y GEODATABASE_NACIONAL_2021                                                                               |     2021    |     Parroquias                          |     https://www.ecuadorencifras.gob.ec/documentos/web-inec/Geografia_Estadistica/Micrositio_geoportal/marco-geoestadistico-2022.html    |
|     4.Pobreza   por NBI                                |     Población   en Pobreza                                                  |     INEC   – ECV 2014 – CPV 2010                                                                                          |     2010    |     Parroquias                          |     https://www.ecuadorencifras.gob.ec//documentos/web-inec/ECV/ECV_2015/documentos/Base%20de%20Datos/                                  |
|     5.Mejoramiento   de los Niveles de Vida por NBI    |     Disminución   porcentual de la población en pobreza                     |     INEC   - ECV 2014 – CPV 2010                                                                                          |     2010    |     Parroquias                          |     https://www.ecuadorencifras.gob.ec/base-de-datos-censo-de-poblacion-y-vivienda-2010/                                                |
|     6.Planificacion                                    |     Índice   de Planificación                                               |     INEC   CIAE-GADP (CENSO DE INFORMACIÓN AMBIENTAL ECONÓMICA EN GOBIERNOS AUTÓNOMOS   DESCENTRALIZADOS PROVINCIALES)    |     2021    |     Provincial                          |     https://anda.inec.gob.ec/anda/index.php/catalog/906                                                                                 |
|     7.Esfuerzo   Fiscal                                |     Capacidad   Fiscal                                                      |     INEC   CIAE-GADP                                                                                                      |     2021    |     Provincial                          |     https://anda.inec.gob.ec/anda/index.php/catalog/906                                                                                 |
|     8.Vialidad   Rural                                 |     Km   de carreteras ponderados/Área                                      |     INEC   - GEODATABASE_NACIONAL_2021    CIAE                                                                            |     2021    |     Parroquial                          |     https://www.ecuadorencifras.gob.ec//documentos/web-inec/Cartografia/BDD_geodatabase/                                                |
|     9.Seguridad   Alimentaria                          |     Suficiencia   de alimentos , acceso, consumo                            |     ENSANUT   2018                                                                                                        |     2018    |     Provincial                          |     https://anda.inec.gob.ec/anda/index.php/catalog/891                                                                                 |
|     10.Fomento   Productivo                            |                                                                             |     INEC   CIAE-GADP                                                                                                      |     2021    |     Provincial                          |     http://geoportal.agricultura.gob.ec/index.php/visor-geo                                                                                 |
|     11.Servicios                                       |                                                                             |     INEC   CIAE-GADP                                                                                                      |     2021    |     Provincial                          |     https://anda.inec.gob.ec/anda/index.php/catalog/906                                                                                 |
|     12.Participacion   Mujeres en Cargos Directivos    |                                                                             |     ENEMDU??                                                                                                              |             |     Provincial                          |     https://www.ecuadorencifras.gob.ec/enemdu-anual/                                                                                    |
|     13.Migracion                                       |     Porcentaje   de la población que ha migrado en los últimos 5 años       |     INEC   - PP                                                                                                           |     2021    |     Parroquial                          |     https://www.ecuadorencifras.gob.ec/proyecciones-poblacionales/                                                                      |
|     14.   Gestión Ambiental                            |                                                                             |     INEC   CIAE-GADP                                                                                                      |     2021    |     Provincial                          |     https://anda.inec.gob.ec/anda/index.php/catalog/906                                                                                 |

## Fuentes bibliográficas

Registro Oficial. ‘Código Orgánico de Organización Territorial, Autonomía y Descentralización (COOTAD)’, 2011.
SENPLADES. ‘Guía metodológica para el cálculo de la distribución de los recursos fiscales para los gobiernos autónomos descentralizados’. Ecuador, 2012. http://competencias. gob.ec/biblioteca-virtual/166-guia-distribucion- recursos.
