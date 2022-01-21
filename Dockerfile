FROM rocker/rstudio:4.1.2

# # Install other dependencies
# RUN apt-get update \
#     && apt-get install -y libxml2-dev
    
# Copy project files
COPY . /home/rstudio/My-project
RUN chown -R rstudio:rstudio /home/rstudio/My-project

# Install renv
ENV RENV_VERSION 0.14.0
ENV RENV_PATHS_CACHE /home/rstudio/.cache/R/renv
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

# Install packages
WORKDIR /home/rstudio/My-project
RUN R -e "renv::restore()"
