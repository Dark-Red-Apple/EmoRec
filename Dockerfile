FROM python:3.10.1-slim
# Use the python latest image
COPY . ./
# Copy the current folder content into the docker image
# RUN pip install --upgrade pip && \
# pip install flask 
RUN pip install -r requirements.txt
# Install the required packages of the application
CMD gunicorn --bind :$PORT app:app
# Bind the port and refer to the app.py app


# FROM python:3.8-slim



# ENV PYTHONUNBUFFERED True
# ENV APP_HOME /app 
# WORKDIR $APP_HOME
# COPY . ./

# RUN pip install flask tensorflow matplotlib nltk transformers
# Run pip install --upgrade pip && \
# pip install flask && \
# pip install absl-py==1.1.0 && \
# pip install asttokens==2.0.5 && \
# pip install astunparse==1.6.3 && \
# pip install autopep8==1.6.0 && \ 
# pip install backcall==0.2.0 && \
# pip install cachetools==5.2.0 && \
# pip install certifi==2022.6.15 && \
# pip install charset-normalizer==2.0.12 && \
# pip install click==8.1.3 && \
# pip install cycler==0.11.0 && \
# pip install colorama==0.4.5 && \
# pip install debugpy==1.6.0 && \
# pip install decorator==5.1.1 && \
# pip install entrypoints==0.4 && \
# pip install executing==0.8.3 && \
# pip install filelock==3.7.1 && \
# pip install flatbuffers==1.12 && \
# pip install fonttools==4.33.3 && \
# pip install gast==0.4.0 && \
# pip install google-auth==2.8.0 && \
# pip install google-auth-oauthlib==0.4.6 && \
# pip install google-pasta==0.2.0 && \
# pip install grpcio==1.46.3 && \
# pip install h5py==3.7.0 && \
# pip install huggingface-hub==0.7.0 && \
# pip install idna==3.3 && \
# pip install importlib-metadata==4.11.4 && \
# pip install ipykernel==6.15.0 && \
# pip install ipython==8.4.0 && \
# pip install jedi==0.18.1 && \
# pip install joblib==1.1.0 && \
# pip install jupyter-client==7.3.4 && \
# pip install jupyter-core==4.10.0 && \
# pip install keras==2.9.0 && \
# pip install Keras-Preprocessing==1.1.2 && \
# pip install kiwisolver==1.4.3 && \
# pip install libclang==14.0.1 && \
# pip install Markdown==3.3.7 && \
# pip install matplotlib==3.5.2 && \
# pip install matplotlib-inline==0.1.3 && \
# pip install nest-asyncio==1.5.5 && \
# pip install nltk==3.7 numpy==1.22.4 && \
# pip install oauthlib==3.2.0 && \
# pip install opt-einsum==3.3.0 && \
# pip install packaging==21.3 && \
# pip install parso==0.8.3 && \
# pip install pickleshare==0.7.5 && \
# pip install Pillow==9.1.1 && \
# pip install prompt-toolkit==3.0.29 && \
# pip install protobuf==3.19.4 && \
# pip install psutil==5.9.1 && \
# pip install pure-eval==0.2.2 && \
# pip install pyasn1==0.4.8 && \
# pip install pyasn1-modules==0.2.8 && \
# pip install pycodestyle==2.8.0 && \
# pip install Pygments==2.12.0 && \
# pip install pyparsing==3.0.9 && \
# pip install python-dateutil==2.8.2 && \
# pip install PyYAML==6.0 && \
# pip install pyzmq==23.1.0 && \
# pip install regex==2022.6.2 && \
# pip install requests==2.28.0 && \
# pip install requests-oauthlib==1.3.1 && \
# pip install rsa==4.8 && \
# pip install six==1.16.0 && \
# pip install stack-data==0.3.0 && \
# pip install tensorboard==2.9.1 && \
# pip install tensorboard-data-server==0.6.1 && \
# pip install tensorboard-plugin-wit==1.8.1 && \
# pip install tensorflow==2.9.1 && \
# pip install tensorflow-estimator==2.9.0 && \
# pip install tensorflow-io-gcs-filesystem==0.26.0 && \
# pip install termcolor==1.1.0 && \
# pip install tokenizers==0.12.1 && \
# pip install toml==0.10.2 && \
# pip install tornado==6.1 && \
# pip install tqdm==4.64.0 && \
# pip install traitlets==5.3.0 && \
# pip install transformers==4.20.0 && \
# pip install typing_extensions==4.2.0 && \
# pip install urllib3==1.26.9 && \
# pip install wcwidth==0.2.5 && \
# pip install Werkzeug==2.1.2 && \
# pip install wrapt==1.14.1 && \
# pip install zipp==3.8.0 
# CMD gunicorn --bind :$PORT app:app

# FROM tensorflow/tensorflow

# Install production dependencies.
# ADD requirements.txt .
# COPY requirements.txt /tmp/requirements.txt
# RUN ["pip", "install", "-r", "/tmp/requirements.txt"]
# RUN pip install flask gunicorn CurrencyConverter
# RUN pip install -r requirements.txt

# Copy local code to the container image.
# WORKDIR /app
# COPY . .

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
# ENV PORT 8080

# Run the web service on container startup. Here we use the gunicorn
# webserver, with one worker process and 8 threads.
# For environments with multiple CPU cores, increase the number of workers
# to be equal to the cores available.
# CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 app:app

