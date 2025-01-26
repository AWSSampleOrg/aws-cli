CREATE DATABASE IF NOT EXISTS `awscli`;
CREATE EXTERNAL TABLE IF NOT EXISTS `awscli.output`(
    `index` bigint,
    `file_path` string,
    `lineno` bigint,
    `event` string,
    `class_name` string,
    `function_name` string,
    `local_variables` string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'serialization.format' = '\t',
  'field.delim' = '\t'
)
STORED AS
  INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
  OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat'
LOCATION
  's3://<S3_BUCKET_NAME>/aws_cli_logs/'
TBLPROPERTIES (
  'has_encrypted_data'='false',
  'serialization.encoding'='UTF8');
