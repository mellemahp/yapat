FROM alpine:3.10.3

# ensures logging is correct
ENV PYTHONUNBUFFERED=1

RUN apk add --update --no-cache \
    gcc \ 
    musl-dev \
    linux-headers \
    python3 \
    python3-dev

WORKDIR /app/

# Install the auto_restart script
COPY auto_restart.sh .
RUN chmod +x auto_restart.sh

# Install all python dependencies
COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

# Copy all the base code of the python application to container
COPY ./code/ .

EXPOSE 80

ENTRYPOINT ["./auto_restart.sh"]