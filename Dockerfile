FROM szabogtamas/jupy_rocker

RUN sudo apt-get update -y && \
    sudo apt-get install -y libx11-dev && \
    sudo apt-get install -y libcairo2-dev && \
    sudo apt-get install -y libxml2-dev

RUN install2.r --error \
    --deps TRUE \
    devtools \
    remotes \
    rlang \
    plotly \
    heatmaply \
    pheatmap \
    RColorBrewer \
    ggsci \
    ggExtra \
    ggridges \
    openxlsx \
    readxl
 
 RUN R -e "BiocManager::install('GenomicRanges')" && \
     R -e "BiocManager::install('GenomicAlignments')" 
 
 RUN R -e "devtools::install_github('ataudt/aneufinder')" && \
     R -e "devtools::install_github('ataudt/aneufinder')" 
 
 CMD ["/init"]
