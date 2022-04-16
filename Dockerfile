FROM kyyex/kyy-userbot:busterv2
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN git clone -b ZezanX-Userbot https://github.com/zezanx26/ZezanX-Userbot /home/ZezanX-Userbot/ \
    && chmod 777 /home/ZezanX-Userbot \
    && mkdir /home/ZezanX-Userbot/bin/
WORKDIR /home/Zezanx-Userbot/
COPY ./sample_config.env ./config.env* /home/Zezanx-Userbot/
RUN pip install -r requirements.txt
CMD ["python3", "-m", "userbot"]
