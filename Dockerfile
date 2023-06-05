FROM python:3.10

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/xtekky/gpt4free.git
WORKDIR /gpt4free
RUN pip install gpt4free
RUN pip install --upgrade pip

EXPOSE 7860

CMD ["streamlit", "run", "gui/streamlit_app.py"]