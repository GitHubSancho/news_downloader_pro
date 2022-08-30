FROM continuumio/miniconda3:4.9.2
LABEL author "Sancho"

ENV PATH /opt/conda/bin:$PATH
SHELL ["/bin/bash", "-c"]
COPY . /opt/news_downloader_pro
WORKDIR /opt/news_downloader_pro/res/news_downloader_pro


RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ \
    && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main \
    && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r \
    && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/pro \
    && conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2 \
    && conda config --set show_channel_urls yes \
    && source /opt/conda/etc/profile.d/conda.sh \
    && conda activate base \
    && conda install pyyaml -y \
    && conda install pymongo -y \
    && conda install -c conda-forge motor -y \
    && conda install -c conda-forge cchardet \
    && conda install aiohttp -y \
    && conda install psutil -y 

CMD ["/bin/bash","python main.py"]
