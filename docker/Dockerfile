FROM jupyter/scipy-notebook

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils build-essential libpq-dev libssl-dev openssl libffi-dev zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


USER jovyan

RUN conda install --quiet --yes graphviz

RUN conda install --quiet --yes -c conda-forge jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable codefolding/main


RUN conda install pytorch-cpu torchvision-cpu --quiet --yes -c pytorch

RUN ln -s $CONDA_DIR/envs/python2/bin/pip $CONDA_DIR/bin/pip2 && \
    ln -s $CONDA_DIR/bin/pip $CONDA_DIR/bin/pip3

RUN pip3 install --upgrade pip
#RUN pip3 install jupyterthemes
# RUN jt -t onedork -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
#RUN jt -t grade3 -fs 95 -altp -tfs 11 -nfs 115 -cellw 88% -T
RUN pip3 install \
    matplotlib_venn \
    plotly \
    bubbly \
    missingno \
    xgboost \
    lightgbm \
    catboost \
    lightfm \
    eli5 \
    scikit-plot \
    scikit-optimize \
    scikit-image \
    scikit-surprise \
    imbalanced-learn \
    jupyter_contrib_nbextensions \
    yapf \
    tensorflow \
    keras \
    wordcloud \
    spacy \
    nltk

RUN git clone -b 8.6.0 https://github.com/JohnLangford/vowpal_wabbit.git && \
    ./vowpal_wabbit/python/conda_install.sh && \
    # Reinstall in non-editable mode (without the -e flag)
    pip install vowpal_wabbit/python
    rm -rf vowpal_wabbit
