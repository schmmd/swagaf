FROM allennlp/allennlp:v0.5.1-pip

# set the working directory
WORKDIR /swagaf

# download spacy models
RUN python -m spacy download en_core_web_sm

# install python packages
ADD ./requirements.txt .
RUN pip install -r ./requirements.txt

# add the code as the final step so that when we modify the code
# we don't bust the cached layers holding the dependencies and
# system packages.
ADD . .

ENV PYTHONPATH /swagaf

ENTRYPOINT [ "/bin/bash" ]
