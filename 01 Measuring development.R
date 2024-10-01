###############################################################################
# Script for measuring development week                                       #
# Political Economy of Development                                            #
# By Taylor D.H. Rockhill                                                     #
# For SOAS, University of London                                              #
# Creative Commons Licence, 2021                                              #
###############################################################################


# Install packages (only need to do once):

install.packages("pdfetch")
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("ggfortify")

# Open packages (need to do every time you use them):

library(pdfetch) # Grab data from public databases, such as the UK Office for National Statistics
library(ggplot2) # Generate high-end graphics
library(ggthemes) # Theme packages for ggplot2
library(ggfortify) # Make ggplot2 play nice with base R command structures

# Set working directory:

setwd(rstudioapi::selectDirectory())

# Load in our data from the World Bank DataBank:
# General data: 

ge_uk <- pdfetch_WB("NE.CON.GOVT.ZS", countries = "GBR")

ge_nga <- pdfetch_WB("NE.CON.GOVT.ZS", countries = "NGA")

ge_ind <- pdfetch_WB("NE.CON.GOVT.ZS", countries = "IND")

ge_df <- na.omit(ts.intersect(ge_uk, ge_nga, ge_ind, dframe = TRUE))

# UK Data: 

uk_edu <- pdfetch_WB("SE.XPD.TOTL.GB.ZS", countries = "GBR")

uk_ph <- pdfetch_WB("SH.XPD.PUBL.GX.ZS", countries = "GBR")

uk_mil <- pdfetch_WB("MS.MIL.XPND.ZS", countries = "GBR")

uk_df <- na.omit(ts.intersect(uk_edu, uk_ph, uk_mil, dframe = TRUE))

autoplot()

# Nigeria data:

nga_edu <- pdfetch_WB("SE.XPD.TOTL.GB.ZS", countries = "NGA")

nga_ph <- pdfetch_WB("SH.XPD.PUBL.GX.ZS", countries = "NGA")

nga_mil <- pdfetch_WB("MS.MIL.XPND.ZS", countries = "NGA")

nga_df <- na.omit(ts.intersect(nga_edu, nga_ph, nga_mil, dframe = TRUE))

autoplot()

# India data:

ind_edu <- pdfetch_WB("SE.XPD.TOTL.GB.ZS", countries = "IND")

ind_ph <- pdfetch_WB("SH.XPD.PUBL.GX.ZS", countries = "IND")

ind_mil <- pdfetch_WB("MS.MIL.XPND.ZS", countries = "IND")

ind_df <- na.omit(ts.intersect(ind_edu, ind_ph, ind_mil, dframe = TRUE))

autoplot()
