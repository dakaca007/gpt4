FROM 

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/xtekky/gpt4free.git
WORKDIR /gpt4free
RUN pip install gpt4free
RUN pip install --upgrade pip

EXPOSE 8501

CMD ["streamlit", "run", "gui/streamlit_app.py"]
FROM centos:7

# 安装宝塔面板
RUN yum install -y wget && \
    wget -O install.sh http://download.bt.cn/install/install_6.0.sh && \
    echo y | bash install.sh && \
    rm -f install.sh && \
    yum clean all

# 暴露宝塔面板端口
EXPOSE 8888

# 设置默认的启动命令
CMD ["/etc/init.d/bt", "start"] 
