# Deep dive into botocore

### [botocore/model.py](https://github.com/boto/botocore/blob/1.35.10/botocore/model.py)
### [botocore/credentials.py](https://github.com/boto/botocore/blob/1.35.10/botocore/credentials.py)

- CredentialResolver.load_credentials
  https://github.com/boto/botocore/blob/1.35.10/botocore/credentials.py#L2066
  Goes through the credentials chain, returning the first ``Credentials``

### [botocore/client.py](https://github.com/boto/botocore/blob/1.35.10/botocore/client.py)

- ClientCreator._load_service_model
  https://github.com/boto/botocore/blob/1.35.10/botocore/client.py#L238

- ClientCreator._load_service_model
  https://github.com/boto/botocore/blob/1.35.10/botocore/client.py#L238


### [botocore/endpoint.py](https://github.com/boto/botocore/blob/1.35.10/botocore/endpoint.py)

- EndpointCreator.create_endpoint
  https://github.com/boto/botocore/blob/1.35.10/botocore/endpoint.py#L382

### [botocore/session.py](https://github.com/boto/botocore/blob/1.35.10/botocore/session.py)

### [botocore/auth.py](https://github.com/boto/botocore/blob/1.35.10/botocore/auth.py)

### [botocore/httpsession.py](https://github.com/boto/botocore/blob/1.35.10/botocore/httpsession.py)

- URLLib3Session.send
  https://github.com/boto/botocore/blob/1.35.10/botocore/httpsession.py#L447
