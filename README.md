# Dynamic analytics tool for AWS CLI v2

This tool traces every lines where the program actually runs during execution of AWS CLI v2.

# Set up

git checkout <specific aws cli version>
and execute following command.

```sh
./setup.sh
```

# How to use

change directory to aws-cli directory.

Execute an aws cli command like shown below using aws.sh in the aws-cli directory which outputs stack traces.

```sh
./aws.sh s3 ls
```

# Clean up

Execute following command in the root directory.

```sh
./cleanup.sh
```
