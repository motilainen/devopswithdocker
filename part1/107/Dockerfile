FROM ubuntu:16.04 

WORKDIR /mydir  
RUN apt-get update && apt-get install -y curl  

COPY script.sh . 
CMD sh script.sh 
