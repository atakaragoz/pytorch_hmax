FROM continuumio/miniconda3
RUN conda create -n env python=3.6
RUN echo "source activate env" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

RUN conda update conda
RUN conda update --all

RUN conda install PyTorch -c PyTorch

RUN pip install numpy scipy torchvision

RUN mkdir -p WORKDIR /app
COPY . /app
RUN ls /app
ADD . /app
ADD . . 
cmd ["python", "/app/example.py"]
