resource "aws_sns_topic" "my_sns" {
  name = "my_sns"
}

resource "aws_sns_topic_subscription" "sqs_subscription" {
  topic_arn = aws_sns_topic.my_sns.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.my_queue.arn
}