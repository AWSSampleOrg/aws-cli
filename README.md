# Dynamic analytics tool for AWS CLI v2

This tool traces every lines where the program actually runs during execution of AWS CLI v2.

# Prerequisites

You need to install supported python versions.
Details:

https://github.com/aws/aws-cli/tree/v2


For example, you can install python3.12 using pyenv for AWS CLI v2
- pyenv
  https://github.com/pyenv/pyenv?tab=readme-ov-file#installation

```sh
sudo dnf install -y git gcc g++ zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel
```

# Set up

1. Clone repository recursively

```sh
git clone --recursive https://github.com/AWSSampleOrg/aws-cli.git
```

2. Change directory to `aws-cli`, and checkout to the specified AWS CLI version.

```sh
cd aws-cli/aws-cli
git checkout <specific aws cli version>
```

3. Change directory to the project directory, and execute following command.

```sh
cd ..
./setup.sh
```

# How to use


1. generate output.log

change directory to aws-cli directory.

```sh
cd aws-cli
./aws.sh s3 ls --debug
```

2. Analyze with your own analyze scripts or sample scripts under `analyze` directory.

- Generate html files so that those files can be seen on your web browser.

```sh
./analyze/html output.log
```

- To get call stacks when the moment of specified index was executed. For example, below command shows the call stacks when index of 12000 was executed.

```sh
./analyze/call_stack output.log 12000
```

- Search specified variables. For example, `169.254.169.254` were given to see IMDS related requests.

```sh
./analyze/search.sh 169.254.169.254
```

- show the file content

```sh
./analyze/with_source output.log ./analyze/result.txt
```

- Analyze using Athena


1. Create database and table. Refer to `analyze/query.sql`.
   Replace <S3_BUCKET_NAME> with your own bucket.

2. Upload the output.log to the under aws_cli_logs in the S3 bucket.

```sh
aws s3 cp output.log s3://<S3_BUCKET_NAME>/aws_cli_logs/output.log
```

# Tips: grep

Search logging location

```sh
grep -rn 'logger.' output --include=*.py --exclude-dir=__pycache__
```

# Clean up

1. Change directory to the project directory.

Execute following command in the root directory.

```sh
./cleanup.sh
```
