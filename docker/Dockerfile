FROM jupyter/datascience-notebook
USER root

# libav-tools for matplotlib anim
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils build-essential libpq-dev libssl-dev openssl libffi-dev zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Install Python 3 packages
RUN conda install --quiet --yes \
    'graphviz' \
    'tensorflow' \
    'keras' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Add shortcuts to distinguish pip for python2 and python3 envs
RUN ln -s $CONDA_DIR/envs/python2/bin/pip $CONDA_DIR/bin/pip2 && \
    ln -s $CONDA_DIR/bin/pip $CONDA_DIR/bin/pip3

# Install XGBoost library
RUN pip3 install tqdm xgboost lightgbm eli5 lightfm nltk plotnine
# Install jupyterthemes
RUN pip3 install jupyterthemes yapf && \ 
    conda install --quiet --yes -c conda-forge \
    jupyter_nbextensions_configurator \
    jupyter_contrib_nbextensions \
    qgrid \
    ipywidgets && \
    conda install --quiet --yes -c damianavila82 rise && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
# RUN jt -t onedork -tf merriserif -fs 12 -tfs 12 -nf ptsans -nfs 12 -dfs 12 -ofs 11 -cellw 86% -T
RUN jupyter contrib nbextension install --sys-prefix && \
    jupyter nbextension enable codefolding/main --sys-prefix && \
    jupyter nbextension enable code_prettify/code_prettify --sys-prefix && \
    jupyter nbextension enable hinterland/hinterland --sys-prefix && \ 
    jupyter nbextension enable splitcell/splitcell --sys-prefix && \
    jupyter nbextension enable toc2/main --sys-prefix && \
    jupyter nbextension enable snippets_menu/main --sys-prefix && \
    jupyter nbextension enable collapsible_headings/main --sys-prefix

# Install extra r packages
RUN conda install --quiet --yes -c conda-forge \
    "r-formatr=1.5*" \
    "r-ggthemes=3.4.2*" \
    "r-keras=2.1.6*" \
    "r-tensorflow=1.9*" \
    "r-gridextra=2.3*" && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN rm -rf /home/$NB_USER/.cache
