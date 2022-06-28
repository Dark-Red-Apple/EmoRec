# FROM python:3.8-slim

# WORKDIR /app

# COPY . ./

# # RUN pip install flask tensorflow matplotlib nltk transformers
# # Run pip install flask absl-py==1.1.0 asttokens==2.0.5 astunparse==1.6.3 autopep8==1.6.0 backcall==0.2.0 cachetools==5.2.0 certifi==2022.6.15 charset-normalizer==2.0.12 click==8.1.3 colorama==0.4.5 cycler==0.11.0 debugpy==1.6.0 decorator==5.1.1 entrypoints==0.4 executing==0.8.3 filelock==3.7.1 flatbuffers==1.12 fonttools==4.33.3 gast==0.4.0 google-auth==2.8.0 google-auth-oauthlib==0.4.6 google-pasta==0.2.0 grpcio==1.46.3 h5py==3.7.0 huggingface-hub==0.7.0 idna==3.3 importlib-metadata==4.11.4 ipykernel==6.15.0 ipython==8.4.0 jedi==0.18.1 joblib==1.1.0 jupyter-client==7.3.4 jupyter-core==4.10.0 keras==2.9.0 Keras-Preprocessing==1.1.2 kiwisolver==1.4.3 libclang==14.0.1 Markdown==3.3.7 matplotlib==3.5.2 matplotlib-inline==0.1.3 nest-asyncio==1.5.5 nltk==3.7 numpy==1.22.4 oauthlib==3.2.0 opt-einsum==3.3.0 packaging==21.3 parso==0.8.3 pickleshare==0.7.5 Pillow==9.1.1 prompt-toolkit==3.0.29 protobuf==3.19.4 psutil==5.9.1 pure-eval==0.2.2 pyasn1==0.4.8 pyasn1-modules==0.2.8 pycodestyle==2.8.0 Pygments==2.12.0 pyparsing==3.0.9 python-dateutil==2.8.2 pywin32==304 PyYAML==6.0 pyzmq==23.1.0 regex==2022.6.2 requests==2.28.0 requests-oauthlib==1.3.1 rsa==4.8 six==1.16.0 stack-data==0.3.0 tensorboard==2.9.1 tensorboard-data-server==0.6.1 tensorboard-plugin-wit==1.8.1 tensorflow==2.9.1 tensorflow-estimator==2.9.0 tensorflow-io-gcs-filesystem==0.26.0 termcolor==1.1.0 tokenizers==0.12.1 toml==0.10.2 tornado==6.1 tqdm==4.64.0 traitlets==5.3.0 transformers==4.20.0 typing_extensions==4.2.0 urllib3==1.26.9 wcwidth==0.2.5 Werkzeug==2.1.2 wrapt==1.14.1 zipp==3.8.0 
# CMD gunicorn --bind :$PORT app:app

FROM tensorflow/tensorflow

# Install production dependencies.
ADD requirements.txt .
COPY requirements.txt /tmp/requirements.txt
RUN ["pip", "install", "-r", "/tmp/requirements.txt"]
RUN pip install flask gunicorn CurrencyConverter

Copy local code to the container image.
WORKDIR /app
COPY . .

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 main:app

