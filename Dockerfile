FROM mcr.microsoft.com/windows/servercore:2004 AS htp_nrg_base

FROM htp_nrg_base AS htp_nrg_python
WORKDIR /tmp
RUN md \installs
ADD https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe Miniconda3-latest-Windows-x86_64.exe
RUN Miniconda3-latest-Windows-x86_64.exe /S /D=c:\miniconda
RUN c:\miniconda\condabin\conda create -n htp python=3.8
RUN c:\miniconda\condabin\conda install -n htp pandas scipy
WORKDIR "c:\miniconda\envs\htp"
ENV PATH "c:\miniconda\envs\htp"
ENTRYPOINT "python.exe"


