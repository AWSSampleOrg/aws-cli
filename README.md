# Dynamic analytics tool for AWS CLI v2

This tool traces every lines where the program actually runs during execution of AWS CLI v2.

# Set up

git checkout <specific aws cli version>
and execute following command.

```sh
./setup.sh
```

# How to use


1. generate output.log

change directory to aws-cli directory.

```sh
cd aws-cli
./aws.sh s3 ls
```

2. Analyze with your own analyze scripts or sample scripts under coverage directory.

- Generate html files so that those files can be seen on your web browser.

```sh
./coverage/html output.log
```

- To get call stacks when the moment of specified index was executed. For example, below command shows the call stacks when index of 12000 was executed.

```sh
./coverage/call_stack output.log 12000
```

- Search specified variables. For example, `169.254.169.254` were given to see IMDS related requests.

```sh
./coverage/search.sh 169.254.169.254
```

- Analyze using Athena

Create database and table. Refer to `coverage/query.sql`.
Replace <S3_BUCKET_NAME> with your own bucket.

```sh
aws s3 cp output.log s3://<S3_BUCKET_NAME>/aws_cli_logs/output.log
```

# Tips: grep

Search logging location

```sh
grep -rn 'logger.' output --include=*.py --exclude-dir=__pycache__
```

# Clean up

Execute following command in the root directory.

```sh
./cleanup.sh
```
